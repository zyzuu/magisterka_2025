//`include "env_pkg.sv"
//`timescale 1ns/1ns
module top;
  import env_pkg::*;
  import uvm_pkg::*;
  // Clock and reset signal declaration
  bit clk;
  bit reset;

  // Clock generation
  always #50 clk = ~clk;

  // Reset Generation
  initial begin
    reset = 1;
    repeat(5) begin
      @(posedge clk);
    end
    reset = 0;
  end

  base_if m_vif_00(clk, reset);
  base_if m_vif_01(clk, reset);
  base_if m_vif_02(clk, reset);
  base_if m_vif_03(clk, reset);
  base_if m_vif_04(clk, reset);
  base_if m_vif_05(clk, reset);
  base_if m_vif_06(clk, reset);
  base_if m_vif_07(clk, reset);

  base_if s_vif_00(clk, reset);
  base_if s_vif_01(clk, reset);
  base_if s_vif_02(clk, reset);
  base_if s_vif_03(clk, reset);
  base_if s_vif_04(clk, reset);
  base_if s_vif_05(clk, reset);
  base_if s_vif_06(clk, reset);
  base_if s_vif_07(clk, reset);
  base_if s_vif_08(clk, reset);
  base_if s_vif_09(clk, reset);
  base_if s_vif_10(clk, reset);
  base_if s_vif_11(clk, reset);
  base_if s_vif_12(clk, reset);
  base_if s_vif_13(clk, reset);
  base_if s_vif_14(clk, reset);
  base_if s_vif_15(clk, reset);

  //DUT instance, interface signals are connected to the DUT ports
  wb_conmax_top DUT (
  .clk_i(clk),
  .rst_i(reset),
  // Master 0 Interface
  .m0_data_i(m_vif_00.data_out),
  .m0_data_o(m_vif_00.data_in),
  .m0_addr_i(m_vif_00.addr),
  .m0_sel_i(m_vif_00.sel),
  .m0_we_i(m_vif_00.we),
  .m0_cyc_i(m_vif_00.cyc),
  .m0_stb_i(m_vif_00.stb),
  .m0_ack_o(m_vif_00.ack),
  .m0_err_o(m_vif_00.err),
  .m0_rty_o(m_vif_00.rty),

  // Master 1 Interface
  .m1_data_i(m_vif_01.data_out),
  .m1_data_o(m_vif_01.data_in),
  .m1_addr_i(m_vif_01.addr),
  .m1_sel_i(m_vif_01.sel),
  .m1_we_i(m_vif_01.we),
  .m1_cyc_i(m_vif_01.cyc),
  .m1_stb_i(m_vif_01.stb),
  .m1_ack_o(m_vif_01.ack),
  .m1_err_o(m_vif_01.err),
  .m1_rty_o(m_vif_01.rty),

  // Master 2 Interface
  .m2_data_i(m_vif_02.data_out),
  .m2_data_o(m_vif_02.data_in),
  .m2_addr_i(m_vif_02.addr),
  .m2_sel_i(m_vif_02.sel),
  .m2_we_i(m_vif_02.we),
  .m2_cyc_i(m_vif_02.cyc),
  .m2_stb_i(m_vif_02.stb),
  .m2_ack_o(m_vif_02.ack),
  .m2_err_o(m_vif_02.err),
  .m2_rty_o(m_vif_02.rty),

  // Master 3 Interface
  .m3_data_i(m_vif_03.data_out),
  .m3_data_o(m_vif_03.data_in),
  .m3_addr_i(m_vif_03.addr),
  .m3_sel_i(m_vif_03.sel),
  .m3_we_i(m_vif_03.we),
  .m3_cyc_i(m_vif_03.cyc),
  .m3_stb_i(m_vif_03.stb),
  .m3_ack_o(m_vif_03.ack),
  .m3_err_o(m_vif_03.err),
  .m3_rty_o(m_vif_03.rty),

  // Master 4 Interface
  .m4_data_i(m_vif_04.data_out),
  .m4_data_o(m_vif_04.data_in),
  .m4_addr_i(m_vif_04.addr),
  .m4_sel_i(m_vif_04.sel),
  .m4_we_i(m_vif_04.we),
  .m4_cyc_i(m_vif_04.cyc),
  .m4_stb_i(m_vif_04.stb),
  .m4_ack_o(m_vif_04.ack),
  .m4_err_o(m_vif_04.err),
  .m4_rty_o(m_vif_04.rty),

  // Master 5 Interface
  .m5_data_i(m_vif_05.data_out),
  .m5_data_o(m_vif_05.data_in),
  .m5_addr_i(m_vif_05.addr),
  .m5_sel_i(m_vif_05.sel),
  .m5_we_i(m_vif_05.we),
  .m5_cyc_i(m_vif_05.cyc),
  .m5_stb_i(m_vif_05.stb),
  .m5_ack_o(m_vif_05.ack),
  .m5_err_o(m_vif_05.err),
  .m5_rty_o(m_vif_05.rty),

  // Master 6 Interface
  .m6_data_i(m_vif_06.data_out),
  .m6_data_o(m_vif_06.data_in),
  .m6_addr_i(m_vif_06.addr),
  .m6_sel_i(m_vif_06.sel),
  .m6_we_i(m_vif_06.we),
  .m6_cyc_i(m_vif_06.cyc),
  .m6_stb_i(m_vif_06.stb),
  .m6_ack_o(m_vif_06.ack),
  .m6_err_o(m_vif_06.err),
  .m6_rty_o(m_vif_06.rty),

  // Master 7 Interface
  .m7_data_i(m_vif_07.data_out),
  .m7_data_o(m_vif_07.data_in),
  .m7_addr_i(m_vif_07.addr),
  .m7_sel_i(m_vif_07.sel),
  .m7_we_i(m_vif_07.we),
  .m7_cyc_i(m_vif_07.cyc),
  .m7_stb_i(m_vif_07.stb),
  .m7_ack_o(m_vif_07.ack),
  .m7_err_o(m_vif_07.err),
  .m7_rty_o(m_vif_07.rty),

  // Slave 0 Interface
  .s0_data_i(s_vif_00.data_in),
  .s0_data_o(s_vif_00.data_out),
  .s0_addr_o(s_vif_00.addr),
  .s0_sel_o(s_vif_00.sel),
  .s0_we_o(s_vif_00.we),
  .s0_cyc_o(s_vif_00.cyc),
  .s0_stb_o(s_vif_00.stb),
  .s0_ack_i(s_vif_00.ack),
  .s0_err_i(s_vif_00.err),
  .s0_rty_i(s_vif_00.rty),

  // Slave 1 Interface
  .s1_data_i(s_vif_01.data_in),
  .s1_data_o(s_vif_01.data_out),
  .s1_addr_o(s_vif_01.addr),
  .s1_sel_o(s_vif_01.sel),
  .s1_we_o(s_vif_01.we),
  .s1_cyc_o(s_vif_01.cyc),
  .s1_stb_o(s_vif_01.stb),
  .s1_ack_i(s_vif_01.ack),
  .s1_err_i(s_vif_01.err),
  .s1_rty_i(s_vif_01.rty),

  // Slave 2 Interface
  .s2_data_i(s_vif_02.data_in),
  .s2_data_o(s_vif_02.data_out),
  .s2_addr_o(s_vif_02.addr),
  .s2_sel_o(s_vif_02.sel),
  .s2_we_o(s_vif_02.we),
  .s2_cyc_o(s_vif_02.cyc),
  .s2_stb_o(s_vif_02.stb),
  .s2_ack_i(s_vif_02.ack),
  .s2_err_i(s_vif_02.err),
  .s2_rty_i(s_vif_02.rty),

  // Slave 3 Interface
  .s3_data_i(s_vif_03.data_in),
  .s3_data_o(s_vif_03.data_out),
  .s3_addr_o(s_vif_03.addr),
  .s3_sel_o(s_vif_03.sel),
  .s3_we_o(s_vif_03.we),
  .s3_cyc_o(s_vif_03.cyc),
  .s3_stb_o(s_vif_03.stb),
  .s3_ack_i(s_vif_03.ack),
  .s3_err_i(s_vif_03.err),
  .s3_rty_i(s_vif_03.rty),

  // Slave 4 Interface
  .s4_data_i(s_vif_04.data_in),
  .s4_data_o(s_vif_04.data_out),
  .s4_addr_o(s_vif_04.addr),
  .s4_sel_o(s_vif_04.sel),
  .s4_we_o(s_vif_04.we),
  .s4_cyc_o(s_vif_04.cyc),
  .s4_stb_o(s_vif_04.stb),
  .s4_ack_i(s_vif_04.ack),
  .s4_err_i(s_vif_04.err),
  .s4_rty_i(s_vif_04.rty),

  // Slave 5 Interface
  .s5_data_i(s_vif_05.data_in),
  .s5_data_o(s_vif_05.data_out),
  .s5_addr_o(s_vif_05.addr),
  .s5_sel_o(s_vif_05.sel),
  .s5_we_o(s_vif_05.we),
  .s5_cyc_o(s_vif_05.cyc),
  .s5_stb_o(s_vif_05.stb),
  .s5_ack_i(s_vif_05.ack),
  .s5_err_i(s_vif_05.err),
  .s5_rty_i(s_vif_05.rty),

  // Slave 6 Interface
  .s6_data_i(s_vif_06.data_in),
  .s6_data_o(s_vif_06.data_out),
  .s6_addr_o(s_vif_06.addr),
  .s6_sel_o(s_vif_06.sel),
  .s6_we_o(s_vif_06.we),
  .s6_cyc_o(s_vif_06.cyc),
  .s6_stb_o(s_vif_06.stb),
  .s6_ack_i(s_vif_06.ack),
  .s6_err_i(s_vif_06.err),
  .s6_rty_i(s_vif_06.rty),

  // Slave 7 Interface
  .s7_data_i(s_vif_07.data_in),
  .s7_data_o(s_vif_07.data_out),
  .s7_addr_o(s_vif_07.addr),
  .s7_sel_o(s_vif_07.sel),
  .s7_we_o(s_vif_07.we),
  .s7_cyc_o(s_vif_07.cyc),
  .s7_stb_o(s_vif_07.stb),
  .s7_ack_i(s_vif_07.ack),
  .s7_err_i(s_vif_07.err),
  .s7_rty_i(s_vif_07.rty),

  // Slave 8 Interface
  .s8_data_i(s_vif_08.data_in),
  .s8_data_o(s_vif_08.data_out),
  .s8_addr_o(s_vif_08.addr),
  .s8_sel_o(s_vif_08.sel),
  .s8_we_o(s_vif_08.we),
  .s8_cyc_o(s_vif_08.cyc),
  .s8_stb_o(s_vif_08.stb),
  .s8_ack_i(s_vif_08.ack),
  .s8_err_i(s_vif_08.err),
  .s8_rty_i(s_vif_08.rty),

  // Slave 9 Interface
  .s9_data_i(s_vif_09.data_in),
  .s9_data_o(s_vif_09.data_out),
  .s9_addr_o(s_vif_09.addr),
  .s9_sel_o(s_vif_09.sel),
  .s9_we_o(s_vif_09.we),
  .s9_cyc_o(s_vif_09.cyc),
  .s9_stb_o(s_vif_09.stb),
  .s9_ack_i(s_vif_09.ack),
  .s9_err_i(s_vif_09.err),
  .s9_rty_i(s_vif_09.rty),

  // Slave 10 Interface
  .s10_data_i(s_vif_10.data_in),
  .s10_data_o(s_vif_10.data_out),
  .s10_addr_o(s_vif_10.addr),
  .s10_sel_o(s_vif_10.sel),
  .s10_we_o(s_vif_10.we),
  .s10_cyc_o(s_vif_10.cyc),
  .s10_stb_o(s_vif_10.stb),
  .s10_ack_i(s_vif_10.ack),
  .s10_err_i(s_vif_10.err),
  .s10_rty_i(s_vif_10.rty),

  // Slave 11 Interface
  .s11_data_i(s_vif_11.data_in),
  .s11_data_o(s_vif_11.data_out),
  .s11_addr_o(s_vif_11.addr),
  .s11_sel_o(s_vif_11.sel),
  .s11_we_o(s_vif_11.we),
  .s11_cyc_o(s_vif_11.cyc),
  .s11_stb_o(s_vif_11.stb),
  .s11_ack_i(s_vif_11.ack),
  .s11_err_i(s_vif_11.err),
  .s11_rty_i(s_vif_11.rty),

  // Slave 12 Interface
  .s12_data_i(s_vif_12.data_in),
  .s12_data_o(s_vif_12.data_out),
  .s12_addr_o(s_vif_12.addr),
  .s12_sel_o(s_vif_12.sel),
  .s12_we_o(s_vif_12.we),
  .s12_cyc_o(s_vif_12.cyc),
  .s12_stb_o(s_vif_12.stb),
  .s12_ack_i(s_vif_12.ack),
  .s12_err_i(s_vif_12.err),
  .s12_rty_i(s_vif_12.rty),

  // Slave 13 Interface
  .s13_data_i(s_vif_13.data_in),
  .s13_data_o(s_vif_13.data_out),
  .s13_addr_o(s_vif_13.addr),
  .s13_sel_o(s_vif_13.sel),
  .s13_we_o(s_vif_13.we),
  .s13_cyc_o(s_vif_13.cyc),
  .s13_stb_o(s_vif_13.stb),
  .s13_ack_i(s_vif_13.ack),
  .s13_err_i(s_vif_13.err),
  .s13_rty_i(s_vif_13.rty),

  // Slave 14 Interface
  .s14_data_i(s_vif_14.data_in),
  .s14_data_o(s_vif_14.data_out),
  .s14_addr_o(s_vif_14.addr),
  .s14_sel_o(s_vif_14.sel),
  .s14_we_o(s_vif_14.we),
  .s14_cyc_o(s_vif_14.cyc),
  .s14_stb_o(s_vif_14.stb),
  .s14_ack_i(s_vif_14.ack),
  .s14_err_i(s_vif_14.err),
  .s14_rty_i(s_vif_14.rty),

  // Slave 15 Interface
  .s15_data_i(s_vif_15.data_in),
  .s15_data_o(s_vif_15.data_out),
  .s15_addr_o(s_vif_15.addr),
  .s15_sel_o(s_vif_15.sel),
  .s15_we_o(s_vif_15.we),
  .s15_cyc_o(s_vif_15.cyc),
  .s15_stb_o(s_vif_15.stb),
  .s15_ack_i(s_vif_15.ack),
  .s15_err_i(s_vif_15.err),
  .s15_rty_i(s_vif_15.rty)
  );

  initial begin
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_00","m_vif_00",m_vif_00);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_01","m_vif_01",m_vif_01);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_02","m_vif_02",m_vif_02);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_03","m_vif_03",m_vif_03);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_04","m_vif_04",m_vif_04);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_05","m_vif_05",m_vif_05);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_06","m_vif_06",m_vif_06);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_07","m_vif_07",m_vif_07);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.m_agent_ral","m_vif_00",m_vif_00);

    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_00","s_vif_00",s_vif_00);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_01","s_vif_01",s_vif_01);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_02","s_vif_02",s_vif_02);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_03","s_vif_03",s_vif_03);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_04","s_vif_04",s_vif_04);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_05","s_vif_05",s_vif_05);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_06","s_vif_06",s_vif_06);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_07","s_vif_07",s_vif_07);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_08","s_vif_08",s_vif_08);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_09","s_vif_09",s_vif_09);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_10","s_vif_10",s_vif_10);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_11","s_vif_11",s_vif_11);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_12","s_vif_12",s_vif_12);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_13","s_vif_13",s_vif_13);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_14","s_vif_14",s_vif_14);
    uvm_config_db#(virtual base_if)::set(null,"uvm_test_top.env.s_agent_15","s_vif_15",s_vif_15);

    //$dumpfile("dump.vcd");
    //$dumpvars;
  end

  initial begin
    run_test();
  end
endmodule : top
