VERIF_DIR := verif
DESIGN_DIR := wb_conmax/rtl/verilog/*.v
QUESTA_HOME = /eda/siemens/questasim_2023.4/questasim
VERIF_SRCS_MASTER_HOME = $(VERIF_DIR)/master
VERIF_SRCS_SLAVE_HOME = $(VERIF_DIR)/slave
VERIF_SRCS :=
VERIF_SRCS += $(VERIF_DIR)/base_if.sv
VERIF_SRCS += $(VERIF_DIR)/seq_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/master/master_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/slave/slave_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/env_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/top.sv
#VERIF_SRCS += $(VERIF_DIR)/base_env.sv
ifneq ($(GUI),1)
GUI_P = -c
endif

comp:
	vlog $(VERIF_SRCS) -L $(QUESTA_HOME)/uvm-1.2

comp_master_files:
	vlog -incr +incdir+$(VERIF_DIR) $(VERIF_SRCS_MASTER_HOME)/master_pkg.sv -L $(QUESTA_HOME)/uvm-1.2

comp_slave_files:
	vlog -incr +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) $(VERIF_SRCS_SLAVE_HOME)/slave_pkg.sv -L $(QUESTA_HOME)/uvm-1.2

comp_env_files:
	vlog -work work $(DESIGN_DIR)  +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) +incdir+$(VERIF_SRCS_MASTER_HOME) $(VERIF_SRCS) -L $(QUESTA_HOME)/uvm-1.2

run:
	vopt +acc top -o top_opt -L $(QUESTA_HOME)/uvm-1.2
	vsim $(GUI_P) top_opt -L $(QUESTA_HOME)/uvm-1.2 +UVM_VERBOSITY=UVM_DEBUG -do "sim.do"
#vsim -c top_opt +UVM_CONFIG_DB_TRACE -L $(QUESTA_HOME)/uvm-1.2 -do "sim.do"
# -c -> command line interface
# +UVM_CONFIG_DB_TRACE +UVM_PHASE_TRACE +UVM_OBJECTION_TRACE
all: comp_env_files run