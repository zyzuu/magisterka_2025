set DESIGN_DIR /home/reddash/Desktop/studia_2_stopien/magisterka/code/wb_conmax/rtl/verilog
set VERIF_DIR /home/reddash/Desktop/studia_2_stopien/magisterka/verif


vlog -sv \
$DESIGN_DIR/wb_conmax_arb.v \
$DESIGN_DIR/wb_conmax_defines.v \
$DESIGN_DIR/wb_conmax_master_if.v \
$DESIGN_DIR/wb_conmax_msel.v \
$DESIGN_DIR/wb_conmax_pri_dec.v \
$DESIGN_DIR/wb_conmax_pri_enc.v \
$DESIGN_DIR/wb_conmax_rf.v \
$DESIGN_DIR/wb_conmax_slave_if.v \
$DESIGN_DIR/wb_conmax_top.v \
$VERIF_DIR/top.sv \
$VERIF_DIR/base_transaction.sv \
$VERIF_DIR/base_sequence.sv \
$VERIF_DIR/base_if.sv \
$VERIF_DIR/base_driver.sv \
$VERIF_DIR/mock_axi_example.sv \
$VERIF_DIR/base_test.sv \
$VERIF_DIR/base_monitor.sv \
$VERIF_DIR/base_env.sv \
$VERIF_DIR/slave/slave_monitor.sv \
$VERIF_DIR/slave/slave_driver.sv \
$VERIF_DIR/slave/slave_agent.sv \
$VERIF_DIR/master/master_monitor.sv \
$VERIF_DIR/master/master_driver.sv \
$VERIF_DIR/master/master_agent.sv

vsim -voptargs="+acc" top
add wave -r /*
run -all