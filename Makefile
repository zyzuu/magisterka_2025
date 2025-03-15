VERIF_DIR := verif
DESIGN_DIR := wb_conmax/rtl/verilog/*.v
QUESTA_HOME = /eda/siemens/questasim_2023.4/questasim
VERIF_SRCS_MASTER_HOME = $(VERIF_DIR)/master
VERIF_SRCS_SLAVE_HOME = $(VERIF_DIR)/slave
VERIF_SRCS :=
#VERIF_SRCS += $(VERIF_DIR)/base_transaction.sv
VERIF_SRCS += $(VERIF_DIR)/seq_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/master/master_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/slave/slave_pkg.sv
VERIF_SRCS += $(VERIF_DIR)/env_pkg.sv
#VERIF_SRCS += $(VERIF_DIR)/top.sv
#VERIF_SRCS += $(VERIF_DIR)/base_env.sv

comp:
	vlog $(VERIF_SRCS) -L $(QUESTA_HOME)/uvm-1.2

comp_master_files:
	vlog -incr +incdir+$(VERIF_DIR) $(VERIF_SRCS_MASTER_HOME)/master_pkg.sv -L $(QUESTA_HOME)/uvm-1.2

comp_slave_files:
	vlog -incr +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) $(VERIF_SRCS_SLAVE_HOME)/slave_pkg.sv -L $(QUESTA_HOME)/uvm-1.2

comp_env_files:
	vlog -work work $(DESIGN_DIR)  +incdir+$(VERIF_DIR) +incdir+$(VERIF_SRCS_SLAVE_HOME) +incdir+$(VERIF_SRCS_MASTER_HOME) $(VERIF_SRCS) -L $(QUESTA_HOME)/uvm-1.2

run:
	vsim wb_conmax_top -L $(QUESTA_HOME)/uvm-1.2
