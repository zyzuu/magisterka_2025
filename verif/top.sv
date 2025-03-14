`include "env_pkg.sv"
module top;
  import env_pkg::*;
  import uvm_pkg::*;
    // Clock and reset signal declaration
    bit clk;
    bit reset;

    // Clock generation
    always #5 clk = ~clk;

    // Reset Generation
    initial begin
        reset = 1;
        #5 reset = 0;
    end

    base_if m_vif_0(clk, ~reset);
    base_if m_vif_1(clk, ~reset);
    base_if m_vif_2(clk, ~reset);
    base_if m_vif_3(clk, ~reset);
    base_if m_vif_4(clk, ~reset);
    base_if m_vif_5(clk, ~reset);
    base_if m_vif_6(clk, ~reset);
    base_if m_vif_7(clk, ~reset);

    base_if s_vif_0(clk, ~reset);
    base_if s_vif_1(clk, ~reset);
    base_if s_vif_2(clk, ~reset);
    base_if s_vif_3(clk, ~reset);
    base_if s_vif_4(clk, ~reset);
    base_if s_vif_5(clk, ~reset);
    base_if s_vif_6(clk, ~reset);
    base_if s_vif_7(clk, ~reset);
    base_if s_vif_8(clk, ~reset);
    base_if s_vif_9(clk, ~reset);
    base_if s_vif_10(clk, ~reset);
    base_if s_vif_11(clk, ~reset);
    base_if s_vif_12(clk, ~reset);
    base_if s_vif_13(clk, ~reset);
    base_if s_vif_14(clk, ~reset);
    base_if s_vif_15(clk, ~reset);

    //DUT instance, interface signals are connected to the DUT ports
    wb_conmax_top DUT (
    .clk_i(clk),
    .rst_i(~reset),
    // Master 0 Interface
    .m0_data_i(m_vif_0.master_if.data_in),
    .m0_data_o(m_vif_0.master_if.data_out),
    .m0_addr_i(m_vif_0.master_if.addr),
    .m0_sel_i(m_vif_0.master_if.sel),
    .m0_we_i(m_vif_0.master_if.we),
    .m0_cyc_i(m_vif_0.master_if.cyc),
    .m0_stb_i(m_vif_0.master_if.stb),
    .m0_ack_o(m_vif_0.master_if.ack),
    .m0_err_o(m_vif_0.master_if.err),
    .m0_rty_o(m_vif_0.master_if.rty),

    // Master 1 Interface
    .m1_data_i(m_vif_1.master_if.data_in),
    .m1_data_o(m_vif_1.master_if.data_out),
    .m1_addr_i(m_vif_1.master_if.addr),
    .m1_sel_i(m_vif_1.master_if.sel),
    .m1_we_i(m_vif_1.master_if.we),
    .m1_cyc_i(m_vif_1.master_if.cyc),
    .m1_stb_i(m_vif_1.master_if.stb),
    .m1_ack_o(m_vif_1.master_if.ack),
    .m1_err_o(m_vif_1.master_if.err),
    .m1_rty_o(m_vif_1.master_if.rty),

    // Master 2 Interface
    .m2_data_i(m_vif_2.master_if.data_in),
    .m2_data_o(m_vif_2.master_if.data_out),
    .m2_addr_i(m_vif_2.master_if.addr),
    .m2_sel_i(m_vif_2.master_if.sel),
    .m2_we_i(m_vif_2.master_if.we),
    .m2_cyc_i(m_vif_2.master_if.cyc),
    .m2_stb_i(m_vif_2.master_if.stb),
    .m2_ack_o(m_vif_2.master_if.ack),
    .m2_err_o(m_vif_2.master_if.err),
    .m2_rty_o(m_vif_2.master_if.rty),

    // Master 3 Interface
    .m3_data_i(m_vif_3.master_if.data_in),
    .m3_data_o(m_vif_3.master_if.data_out),
    .m3_addr_i(m_vif_3.master_if.addr),
    .m3_sel_i(m_vif_3.master_if.sel),
    .m3_we_i(m_vif_3.master_if.we),
    .m3_cyc_i(m_vif_3.master_if.cyc),
    .m3_stb_i(m_vif_3.master_if.stb),
    .m3_ack_o(m_vif_3.master_if.ack),
    .m3_err_o(m_vif_3.master_if.err),
    .m3_rty_o(m_vif_3.master_if.rty),

    // Master 4 Interface
    .m4_data_i(m_vif_4.master_if.data_in),
    .m4_data_o(m_vif_4.master_if.data_out),
    .m4_addr_i(m_vif_4.master_if.addr),
    .m4_sel_i(m_vif_4.master_if.sel),
    .m4_we_i(m_vif_4.master_if.we),
    .m4_cyc_i(m_vif_4.master_if.cyc),
    .m4_stb_i(m_vif_4.master_if.stb),
    .m4_ack_o(m_vif_4.master_if.ack),
    .m4_err_o(m_vif_4.master_if.err),
    .m4_rty_o(m_vif_4.master_if.rty),

    // Master 5 Interface
    .m5_data_i(m_vif_5.master_if.data_in),
    .m5_data_o(m_vif_5.master_if.data_out),
    .m5_addr_i(m_vif_5.master_if.addr),
    .m5_sel_i(m_vif_5.master_if.sel),
    .m5_we_i(m_vif_5.master_if.we),
    .m5_cyc_i(m_vif_5.master_if.cyc),
    .m5_stb_i(m_vif_5.master_if.stb),
    .m5_ack_o(m_vif_5.master_if.ack),
    .m5_err_o(m_vif_5.master_if.err),
    .m5_rty_o(m_vif_5.master_if.rty),

    // Master 6 Interface
    .m6_data_i(m_vif_6.master_if.data_in),
    .m6_data_o(m_vif_6.master_if.data_out),
    .m6_addr_i(m_vif_6.master_if.addr),
    .m6_sel_i(m_vif_6.master_if.sel),
    .m6_we_i(m_vif_6.master_if.we),
    .m6_cyc_i(m_vif_6.master_if.cyc),
    .m6_stb_i(m_vif_6.master_if.stb),
    .m6_ack_o(m_vif_6.master_if.ack),
    .m6_err_o(m_vif_6.master_if.err),
    .m6_rty_o(m_vif_6.master_if.rty),

    // Master 7 Interface
    .m7_data_i(m_vif_7.master_if.data_in),
    .m7_data_o(m_vif_7.master_if.data_out),
    .m7_addr_i(m_vif_7.master_if.addr),
    .m7_sel_i(m_vif_7.master_if.sel),
    .m7_we_i(m_vif_7.master_if.we),
    .m7_cyc_i(m_vif_7.master_if.cyc),
    .m7_stb_i(m_vif_7.master_if.stb),
    .m7_ack_o(m_vif_7.master_if.ack),
    .m7_err_o(m_vif_7.master_if.err),
    .m7_rty_o(m_vif_7.master_if.rty),

    // Slave 0 Interface
    .s0_data_i(s_vif_0.slave_if.data_in),
    .s0_data_o(s_vif_0.slave_if.data_out),
    .s0_addr_i(s_vif_0.slave_if.addr),
    .s0_sel_i(s_vif_0.slave_if.sel),
    .s0_we_i(s_vif_0.slave_if.we),
    .s0_cyc_i(s_vif_0.slave_if.cyc),
    .s0_stb_i(s_vif_0.slave_if.stb),
    .s0_ack_o(s_vif_0.slave_if.ack),
    .s0_err_o(s_vif_0.slave_if.err),
    .s0_rty_o(s_vif_0.slave_if.rty),

    // Slave 1 Interface
    .s1_data_i(s_vif_1.slave_if.data_in),
    .s1_data_o(s_vif_1.slave_if.data_out),
    .s1_addr_i(s_vif_1.slave_if.addr),
    .s1_sel_i(s_vif_1.slave_if.sel),
    .s1_we_i(s_vif_1.slave_if.we),
    .s1_cyc_i(s_vif_1.slave_if.cyc),
    .s1_stb_i(s_vif_1.slave_if.stb),
    .s1_ack_o(s_vif_1.slave_if.ack),
    .s1_err_o(s_vif_1.slave_if.err),
    .s1_rty_o(s_vif_1.slave_if.rty),

    // Slave 2 Interface
    .s2_data_i(s_vif_2.slave_if.data_in),
    .s2_data_o(s_vif_2.slave_if.data_out),
    .s2_addr_i(s_vif_2.slave_if.addr),
    .s2_sel_i(s_vif_2.slave_if.sel),
    .s2_we_i(s_vif_2.slave_if.we),
    .s2_cyc_i(s_vif_2.slave_if.cyc),
    .s2_stb_i(s_vif_2.slave_if.stb),
    .s2_ack_o(s_vif_2.slave_if.ack),
    .s2_err_o(s_vif_2.slave_if.err),
    .s2_rty_o(s_vif_2.slave_if.rty),

    // Slave 3 Interface
    .s3_data_i(s_vif_3.slave_if.data_in),
    .s3_data_o(s_vif_3.slave_if.data_out),
    .s3_addr_i(s_vif_3.slave_if.addr),
    .s3_sel_i(s_vif_3.slave_if.sel),
    .s3_we_i(s_vif_3.slave_if.we),
    .s3_cyc_i(s_vif_3.slave_if.cyc),
    .s3_stb_i(s_vif_3.slave_if.stb),
    .s3_ack_o(s_vif_3.slave_if.ack),
    .s3_err_o(s_vif_3.slave_if.err),
    .s3_rty_o(s_vif_3.slave_if.rty),

    // Slave 4 Interface
    .s4_data_i(s_vif_4.slave_if.data_in),
    .s4_data_o(s_vif_4.slave_if.data_out),
    .s4_addr_i(s_vif_4.slave_if.addr),
    .s4_sel_i(s_vif_4.slave_if.sel),
    .s4_we_i(s_vif_4.slave_if.we),
    .s4_cyc_i(s_vif_4.slave_if.cyc),
    .s4_stb_i(s_vif_4.slave_if.stb),
    .s4_ack_o(s_vif_4.slave_if.ack),
    .s4_err_o(s_vif_4.slave_if.err),
    .s4_rty_o(s_vif_4.slave_if.rty),

    // Slave 5 Interface
    .s5_data_i(s_vif_5.slave_if.data_in),
    .s5_data_o(s_vif_5.slave_if.data_out),
    .s5_addr_i(s_vif_5.slave_if.addr),
    .s5_sel_i(s_vif_5.slave_if.sel),
    .s5_we_i(s_vif_5.slave_if.we),
    .s5_cyc_i(s_vif_5.slave_if.cyc),
    .s5_stb_i(s_vif_5.slave_if.stb),
    .s5_ack_o(s_vif_5.slave_if.ack),
    .s5_err_o(s_vif_5.slave_if.err),
    .s5_rty_o(s_vif_5.slave_if.rty),

    // Slave 6 Interface
    .s6_data_i(s_vif_6.slave_if.data_in),
    .s6_data_o(s_vif_6.slave_if.data_out),
    .s6_addr_i(s_vif_6.slave_if.addr),
    .s6_sel_i(s_vif_6.slave_if.sel),
    .s6_we_i(s_vif_6.slave_if.we),
    .s6_cyc_i(s_vif_6.slave_if.cyc),
    .s6_stb_i(s_vif_6.slave_if.stb),
    .s6_ack_o(s_vif_6.slave_if.ack),
    .s6_err_o(s_vif_6.slave_if.err),
    .s6_rty_o(s_vif_6.slave_if.rty),

    // Slave 7 Interface
    .s7_data_i(s_vif_7.slave_if.data_in),
    .s7_data_o(s_vif_7.slave_if.data_out),
    .s7_addr_i(s_vif_7.slave_if.addr),
    .s7_sel_i(s_vif_7.slave_if.sel),
    .s7_we_i(s_vif_7.slave_if.we),
    .s7_cyc_i(s_vif_7.slave_if.cyc),
    .s7_stb_i(s_vif_7.slave_if.stb),
    .s7_ack_o(s_vif_7.slave_if.ack),
    .s7_err_o(s_vif_7.slave_if.err),
    .s7_rty_o(s_vif_7.slave_if.rty),

    // Slave 8 Interface
    .s8_data_i(s_vif_8.slave_if.data_in),
    .s8_data_o(s_vif_8.slave_if.data_out),
    .s8_addr_i(s_vif_8.slave_if.addr),
    .s8_sel_i(s_vif_8.slave_if.sel),
    .s8_we_i(s_vif_8.slave_if.we),
    .s8_cyc_i(s_vif_8.slave_if.cyc),
    .s8_stb_i(s_vif_8.slave_if.stb),
    .s8_ack_o(s_vif_8.slave_if.ack),
    .s8_err_o(s_vif_8.slave_if.err),
    .s8_rty_o(s_vif_8.slave_if.rty),

    // Slave 9 Interface
    .s9_data_i(s_vif_9.slave_if.data_in),
    .s9_data_o(s_vif_9.slave_if.data_out),
    .s9_addr_i(s_vif_9.slave_if.addr),
    .s9_sel_i(s_vif_9.slave_if.sel),
    .s9_we_i(s_vif_9.slave_if.we),
    .s9_cyc_i(s_vif_9.slave_if.cyc),
    .s9_stb_i(s_vif_9.slave_if.stb),
    .s9_ack_o(s_vif_9.slave_if.ack),
    .s9_err_o(s_vif_9.slave_if.err),
    .s9_rty_o(s_vif_9.slave_if.rty),

    // Slave 10 Interface
    .s10_data_i(s_vif_10.slave_if.data_in),
    .s10_data_o(s_vif_10.slave_if.data_out),
    .s10_addr_i(s_vif_10.slave_if.addr),
    .s10_sel_i(s_vif_10.slave_if.sel),
    .s10_we_i(s_vif_10.slave_if.we),
    .s10_cyc_i(s_vif_10.slave_if.cyc),
    .s10_stb_i(s_vif_10.slave_if.stb),
    .s10_ack_o(s_vif_10.slave_if.ack),
    .s10_err_o(s_vif_10.slave_if.err),
    .s10_rty_o(s_vif_10.slave_if.rty),

    // Slave 11 Interface
    .s11_data_i(s_vif_11.slave_if.data_in),
    .s11_data_o(s_vif_11.slave_if.data_out),
    .s11_addr_i(s_vif_11.slave_if.addr),
    .s11_sel_i(s_vif_11.slave_if.sel),
    .s11_we_i(s_vif_11.slave_if.we),
    .s11_cyc_i(s_vif_11.slave_if.cyc),
    .s11_stb_i(s_vif_11.slave_if.stb),
    .s11_ack_o(s_vif_11.slave_if.ack),
    .s11_err_o(s_vif_11.slave_if.err),
    .s11_rty_o(s_vif_11.slave_if.rty),

    // Slave 12 Interface
    .s12_data_i(s_vif_12.slave_if.data_in),
    .s12_data_o(s_vif_12.slave_if.data_out),
    .s12_addr_i(s_vif_12.slave_if.addr),
    .s12_sel_i(s_vif_12.slave_if.sel),
    .s12_we_i(s_vif_12.slave_if.we),
    .s12_cyc_i(s_vif_12.slave_if.cyc),
    .s12_stb_i(s_vif_12.slave_if.stb),
    .s12_ack_o(s_vif_12.slave_if.ack),
    .s12_err_o(s_vif_12.slave_if.err),
    .s12_rty_o(s_vif_12.slave_if.rty),

    // Slave 13 Interface
    .s13_data_i(s_vif_13.slave_if.data_in),
    .s13_data_o(s_vif_13.slave_if.data_out),
    .s13_addr_i(s_vif_13.slave_if.addr),
    .s13_sel_i(s_vif_13.slave_if.sel),
    .s13_we_i(s_vif_13.slave_if.we),
    .s13_cyc_i(s_vif_13.slave_if.cyc),
    .s13_stb_i(s_vif_13.slave_if.stb),
    .s13_ack_o(s_vif_13.slave_if.ack),
    .s13_err_o(s_vif_13.slave_if.err),
    .s13_rty_o(s_vif_13.slave_if.rty),

    // Slave 14 Interface
    .s14_data_i(s_vif_14.slave_if.data_in),
    .s14_data_o(s_vif_14.slave_if.data_out),
    .s14_addr_i(s_vif_14.slave_if.addr),
    .s14_sel_i(s_vif_14.slave_if.sel),
    .s14_we_i(s_vif_14.slave_if.we),
    .s14_cyc_i(s_vif_14.slave_if.cyc),
    .s14_stb_i(s_vif_14.slave_if.stb),
    .s14_ack_o(s_vif_14.slave_if.ack),
    .s14_err_o(s_vif_14.slave_if.err),
    .s14_rty_o(s_vif_14.slave_if.rty),

    // Slave 15 Interface
    .s15_data_i(s_vif_15.slave_if.data_in),
    .s15_data_o(s_vif_15.slave_if.data_out),
    .s15_addr_i(s_vif_15.slave_if.addr),
    .s15_sel_i(s_vif_15.slave_if.sel),
    .s15_we_i(s_vif_15.slave_if.we),
    .s15_cyc_i(s_vif_15.slave_if.cyc),
    .s15_stb_i(s_vif_15.slave_if.stb),
    .s15_ack_o(s_vif_15.slave_if.ack),
    .s15_err_o(s_vif_15.slave_if.err),
    .s15_rty_o(s_vif_15.slave_if.rty)
    );

    //enabling the wave dump
    initial begin
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_0",m_vif_0);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_1",m_vif_1);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_2",m_vif_2);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_3",m_vif_3);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_4",m_vif_4);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_5",m_vif_5);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_6",m_vif_6);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","m_vif_7",m_vif_7);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_0",s_vif_0);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_1",s_vif_1);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_2",s_vif_2);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_3",s_vif_3);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_4",s_vif_4);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_5",s_vif_5);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_6",s_vif_6);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_7",s_vif_7);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_8",s_vif_8);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_9",s_vif_9);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_10",s_vif_10);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_11",s_vif_11);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_12",s_vif_12);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_13",s_vif_13);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_14",s_vif_14);
        uvm_config_db#(virtual base_if)::set(null,"uvm_test_top","s_vif_15",s_vif_15);
        $dumpfile("dump.vcd");
        $dumpvars;
    end

    initial begin
        run_test("base_test");
    end
endmodule: top