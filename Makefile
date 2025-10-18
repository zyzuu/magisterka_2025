VERIF_DIR := verif
DESIGN_DIR_ := wb_conmax/rtl/verilog/
DESIGN_DIR := wb_conmax/rtl/verilog/*.v
QUESTA_HOME = /eda/siemens/questasim_2023.4/questasim
VCS_HOME = /eda/synopsys/2023-24/RHELx86/VCS_2023.12/etc/
VERIF_SRCS_MASTER_HOME = $(VERIF_DIR)/master
VERIF_SRCS_SLAVE_HOME = $(VERIF_DIR)/slave
VERIF_SRCS_RAL_HOME = $(VERIF_DIR)/ral
VERIF_SRCS :=
VERIF_SRCS += $(VERIF_DIR)/share_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/base_if.sv
VERIF_SRCS += $(VERIF_DIR)/seq_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/ral/ral_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/master/master_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/slave/slave_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/env_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/top.sv
#VERIF_SRCS += $(VERIF_DIR)/base_env.sv
SEED := 1

ALDEC_ENV := . /eda/aldec/Riviera-PRO-2024.10/etc/setenv
SIEMENS_ENV := . /eda/siemens/scripts/setup-fpga-tools.sh
CADENCE_ENV := . /eda/cadence/scripts/cadence-digital_2023.sh
XILINX_ENV := . /eda/utils/set-xilinx-env.sh
SYNOPSYS_ENV := . /eda/synopsys/scripts/add-synopsys-FEV-23-all

GUI_VCS =

TEST ?= base_test

ifneq ($(GUI),1)
GUI_P = -c
GUI_VCS = -gui
endif

ifeq ($(DEBUG),1)
DEBUG_CMD = +UVM_VERBOSITY=UVM_DEBUG +UVM_CONFIG_DB_TRACE +UVM_PHASE_TRACE
endif

#GUI_X = --gui --tclbatch xsim.tcl
#GUI_X = -R

comp_questa:
	$(SIEMENS_ENV)  && \
	vlog $(VERIF_SRCS) $(DESIGN_DIR) -L $(QUESTA_HOME)/uvm-1.2 -timescale=1ns/1ns -sv

elab_questa:
	$(SIEMENS_ENV) && \
	vopt +acc -O5 top -o top_opt -L $(QUESTA_HOME)/uvm-1.2 -noincr

run_questa:
	$(SIEMENS_ENV)  && \
	taskset -c 0-11 vsim $(GUI_P) top_opt -L $(QUESTA_HOME)/uvm-1.2 -autoprofile -logfile sim_$(SEED).log -classdebug  -stats=perf -lineinfo -verboseprofile -do sim.do -uvmcontrol=all $(DEBUG_CMD) +UVM_TESTNAME=$(TEST)
#-do "run -all;"
#-sv_seed $(SEED)
#vsim -c top_opt +UVM_CONFIG_DB_TRACE -L $(QUESTA_HOME)/uvm-1.2 -do "sim.do"
# -c -> command line interface
# +UVM_CONFIG_DB_TRACE +UVM_PHASE_TRACE +UVM_OBJECTION_TRACE

#-uvmver 1.2
comp_aldec:
	$(ALDEC_ENV) && \
	vlib work && \
  set worklib && \
	vlog $(DESIGN_DIR)  +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) +incdir+$(VERIF_SRCS_MASTER_HOME) $(VERIF_SRCS) -sv2k17 -timescale 1ns/1ns -uvmver 1.2 -O3 -nodebug

run_aldec:
	$(ALDEC_ENV) && \
	vsim -c -do sim_aldec.do -O5 -sv_seed $(SEED) -l aldec_$(SEED).log
# wave -rec * shows waveforms inside aldec riviera pro
# -lib work

comp_vcs:
	$(SYNOPSYS_ENV) && \
	vcs -kdb -debug_access+all -sverilog -ntb_opts uvm-1.2  -timescale=1ns/1ns -Xkeyopt=rtopt -Xkeyopt=mvu +rad +incdir+$(VCS_HOME)/uvm-1.2 +incdir+$(DESIGN_DIR_) +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) +incdir+$(VERIF_SRCS_MASTER_HOME) +incdir+$(VERIF_SRCS_RAL_HOME) $(DESIGN_DIR) $(VERIF_SRCS) -cg_coverage_control=1

#comp_vcs:
#	$(SYNOPSYS_ENV) && \
#	vcs -kdb -debug_access+all -timescale=1ns/1ns -sverilog +v2k -ntb_opts uvm-1.2 +incdir+$(DESIGN_DIR_)  +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) +incdir+$(VERIF_SRCS_MASTER_HOME) $(DESIGN_DIR) $(VERIF_SRCS)

run_vcs:
	#$(SYNOPSYS_ENV) && \
	./simv +ntb_random_seed $(SEED) $(GUI_VCS) -l vcs_$(SEED).log -reportstats +UVM_TESTNAME=$(TEST) -cg_coverage_control=1
# \+UVM_PHASE_RECORD $(GUI_VCS) +ntb_solver_debug=verbose +ntb_solver_debug=trace +ntb_solver_debug_filter=all +UVM_VERBOSITY=UVM_DEBUG
comp_master_files:
	vlog -incr +incdir+$(VERIF_DIR) $(VERIF_SRCS_MASTER_HOME)/master_pkg.sv -L $(QUESTA_HOME)/uvm-1.2

comp_slave_files:
	vlog -incr +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) $(VERIF_SRCS_SLAVE_HOME)/slave_pkg.sv -L $(QUESTA_HOME)/uvm-1.2

comp_env_files:
	vlog -work work $(DESIGN_DIR)  +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) +incdir+$(VERIF_SRCS_MASTER_HOME) $(VERIF_SRCS) -L $(QUESTA_HOME)/uvm-1.2

comp_cadence:
	$(CADENCE_ENV) && \
	xrun -compile $(VERIF_SRCS)  $(DESIGN_DIR) -incdir $(DESIGN_DIR_) -incdir $(VERIF_DIR) -incdir $(VERIF_SRCS_SLAVE_HOME) -incdir $(VERIF_SRCS_MASTER_HOME) -timescale 1ns/1ns -sv -uvmhome CDNS-1.2 -uvm -uvmnocdnsextra -hlmdebug off -plusperf -newperf

elab_cadence:
	$(CADENCE_ENV) && \
	xrun -elaborate -noupdate -top worklib.top -timescale 1ns/1ns -hlmdebug off -plusperf -newperf -uvmhome CDNS-1.2 -uvm -uvmnocdnsextra -sv

run_cadence:
	$(CADENCE_ENV) && \
	xrun -R -timescale 1ns/1ns -uvmhome CDNS-1.2 -uvm -uvmnocdnsextra -sv -hlmdebug off -plusperf -newperf -perfstat -logfile cadence_$(SEED).log -svseed $(SEED)

comp_xilinx:
	$(XILINX_ENV) && \
	xvlog $(VERIF_SRCS) $(DESIGN_DIR) -i $(DESIGN_DIR_) -i $(VERIF_DIR) -i $(VERIF_SRCS_SLAVE_HOME) -i $(VERIF_SRCS_MASTER_HOME) -sv -L uvm /eda/xilinx/Vivado/2024.2/data/xsim/system_verilog/uvm_include/uvm_macros.svh --log xvlog_$(SEED).log --uvm_version 1.2
#xsc -shared -v --lib uvm
#xvlog -sv -f adder_4_bit_compile_list.f -L uvm -define NO_OF_TRANSACTIONS=2000;
#xelab adder_4_bit_tb_top -relax -s top -timescale 1ns/1ps;

elab_xilinx:
	$(XILINX_ENV) && \
	xelab top -timescale 1ns/1ns -L uvm -debug off -O3 -log xelab_$(SEED).log --uvm_version 1.2
#-sv_lib dpi

run_xilinx:
	$(XILINX_ENV) && \
	xsim top -testplusarg UVM_TESTNAME=base_test -R -sv_seed $(SEED) --log xsim_$(SEED).log
#xsim top -R -testplusarg UVM_TESTNAME=adder_4_bit_basic_test
