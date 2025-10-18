
##########################################################################
#
# DUT Sources
#
##########################################################################


##########################################################################
#
# Test Bench Sources
#
##########################################################################


##########################################################################
#
# Misc Variables
#
##########################################################################

#INCDIR=+incdir+./$(DUT_SRC_DIR)/ +incdir+./$(TB_SRC_DIR)/
#LOGF=-l .nclog
#UMC_LIB=/tools/dc_libraries/virtual_silicon/umc_lib.v
#GATE_NETLIST = ../../../syn/out/wb_dma_top_ps.v

##########################################################################
#
# Make Targets
#
##########################################################################

DUT_SRC_DIR=../../../rtl/verilog

design_files += $(DUT_SRC_DIR)/wb_conmax_top.v
design_files += $(DUT_SRC_DIR)/wb_conmax_slave_if.v
design_files += $(DUT_SRC_DIR)/wb_conmax_master_if.v
design_files += $(DUT_SRC_DIR)/wb_conmax_msel.v
design_files += $(DUT_SRC_DIR)/wb_conmax_arb.v
design_files += $(DUT_SRC_DIR)/wb_conmax_pri_enc.v
design_files += $(DUT_SRC_DIR)/wb_conmax_pri_dec.v
design_files += $(DUT_SRC_DIR)/wb_conmax_rf.v

defines_files += $(DUT_SRC_DIR)/wb_conmax_defines.v
defines_files += $(TB_SRC_DIR)/wb_model_defines.v
# Verification files
TB_SRC_DIR=../../../bench/verilog
# verif_files += $(TB_SRC_DIR)/tests.v
verif_files += $(TB_SRC_DIR)/test_bench_top.v
verif_files += $(TB_SRC_DIR)/wb_slv_model.v
verif_files += $(TB_SRC_DIR)/wb_mast_model.v

# Misc flags
output_file = test
waves_dump = dump.vcd
# Compilation flags
#comp_flags += #-g2012 # use systemverilog 2012
comp_flags += -o $(output_file) # output file test
comp_flags += -I $(DUT_SRC_DIR) # iverilog requires an explicit search path for include files.
comp_flags += -I $(TB_SRC_DIR)
comp:
	@iverilog $(comp_flags) $(defines_files) $(design_files) $(verif_files)

run:
	@vvp $(output_file)

waves:
	@gtkwave $(waves_dump)

all: comp run waves
