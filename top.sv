module top;
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
    
    base_if.master_if m_vif(clk, ~reset);
    base_if.slave_if s_vif(clk, ~reset);
    
    //DUT instance, interface signals are connected to the DUT ports
    wb_conmax_top DUT (
    .clk_i(clk),
    .rst_i(~reset),
    // Master 0 Interface
    .m0_data_i(m_vif.data_in),
    .m0_data_o(m_vif.data_out),
    .m0_addr_i(m_vif.addr),
    .m0_sel_i(m_vif.sel),
    .m0_we_i(m_vif.we),
    .m0_cyc_i(m_vif.cyc),
    .m0_stb_i(m_vif.stb),
    .m0_ack_o(m_vif.ack),
    .m0_err_o(m_vif.err),
    .m0_rty_o(m_vif.rty),

    // Master 1 Interface
    .m1_data_i(m_vif.data_in),
    .m1_data_o(m_vif.data_out),
    .m1_addr_i(m_vif.addr),
    .m1_sel_i(m_vif.sel),
    .m1_we_i(m_vif.we),
    .m1_cyc_i(m_vif.cyc),
    .m1_stb_i(m_vif.stb),
    .m1_ack_o(m_vif.ack),
    .m1_err_o(m_vif.err),
    .m1_rty_o(m_vif.rty),

    // Master 2 Interface
    .m2_data_i(m_vif.data_in),
    .m2_data_o(m_vif.data_out),
    .m2_addr_i(m_vif.addr),
    .m2_sel_i(m_vif.sel),
    .m2_we_i(m_vif.we),
    .m2_cyc_i(m_vif.cyc),
    .m2_stb_i(m_vif.stb),
    .m2_ack_o(m_vif.ack),
    .m2_err_o(m_vif.err),
    .m2_rty_o(m_vif.rty),

    // Master 3 Interface
    .m3_data_i(m_vif.data_in),
    .m3_data_o(m_vif.data_out),
    .m3_addr_i(m_vif.addr),
    .m3_sel_i(m_vif.sel),
    .m3_we_i(m_vif.we),
    .m3_cyc_i(m_vif.cyc),
    .m3_stb_i(m_vif.stb),
    .m3_ack_o(m_vif.ack),
    .m3_err_o(m_vif.err),
    .m3_rty_o(m_vif.rty),

    // Master 4 Interface
    .m4_data_i(m_vif.data_in),
    .m4_data_o(m_vif.data_out),
    .m4_addr_i(m_vif.addr),
    .m4_sel_i(m_vif.sel),
    .m4_we_i(m_vif.we),
    .m4_cyc_i(m_vif.cyc),
    .m4_stb_i(m_vif.stb),
    .m4_ack_o(m_vif.ack),
    .m4_err_o(m_vif.err),
    .m4_rty_o(m_vif.rty),

    // Master 5 Interface
    .m5_data_i(m_vif.data_in),
    .m5_data_o(m_vif.data_out),
    .m5_addr_i(m_vif.addr),
    .m5_sel_i(m_vif.sel),
    .m5_we_i(m_vif.we),
    .m5_cyc_i(m_vif.cyc),
    .m5_stb_i(m_vif.stb),
    .m5_ack_o(m_vif.ack),
    .m5_err_o(m_vif.err),
    .m5_rty_o(m_vif.rty),

    // Master 6 Interface
    .m6_data_i(m_vif.data_in),
    .m6_data_o(m_vif.data_out),
    .m6_addr_i(m_vif.addr),
    .m6_sel_i(m_vif.sel),
    .m6_we_i(m_vif.we),
    .m6_cyc_i(m_vif.cyc),
    .m6_stb_i(m_vif.stb),
    .m6_ack_o(m_vif.ack),
    .m6_err_o(m_vif.err),
    .m6_rty_o(m_vif.rty),

    // Master 7 Interface
    .m7_data_i(m_vif.data_in),
    .m7_data_o(m_vif.data_out),
    .m7_addr_i(m_vif.addr),
    .m7_sel_i(m_vif.sel),
    .m7_we_i(m_vif.we),
    .m7_cyc_i(m_vif.cyc),
    .m7_stb_i(m_vif.stb),
    .m7_ack_o(m_vif.ack),
    .m7_err_o(m_vif.err),
    .m7_rty_o(m_vif.rty),

    // Slave 0 Interface
    .s0_data_i(s_vif.data_in),
    .s0_data_o(s_vif.data_out),
    .s0_addr_i(s_vif.addr),
    .s0_sel_i(s_vif.sel),
    .s0_we_i(s_vif.we),
    .s0_cyc_i(s_vif.cyc),
    .s0_stb_i(s_vif.stb),
    .s0_ack_o(s_vif.ack),
    .s0_err_o(s_vif.err),
    .s0_rty_o(s_vif.rty),

    // Slave 1 Interface
    .s1_data_i(s_vif.data_in),
    .s1_data_o(s_vif.data_out),
    .s1_addr_i(s_vif.addr),
    .s1_sel_i(s_vif.sel),
    .s1_we_i(s_vif.we),
    .s1_cyc_i(s_vif.cyc),
    .s1_stb_i(s_vif.stb),
    .s1_ack_o(s_vif.ack),
    .s1_err_o(s_vif.err),
    .s1_rty_o(s_vif.rty),

    // Slave 2 Interface
    .s2_data_i(s_vif.data_in),
    .s2_data_o(s_vif.data_out),
    .s2_addr_i(s_vif.addr),
    .s2_sel_i(s_vif.sel),
    .s2_we_i(s_vif.we),
    .s2_cyc_i(s_vif.cyc),
    .s2_stb_i(s_vif.stb),
    .s2_ack_o(s_vif.ack),
    .s2_err_o(s_vif.err),
    .s2_rty_o(s_vif.rty),

    // Slave 3 Interface
    .s3_data_i(s_vif.data_in),
    .s3_data_o(s_vif.data_out),
    .s3_addr_i(s_vif.addr),
    .s3_sel_i(s_vif.sel),
    .s3_we_i(s_vif.we),
    .s3_cyc_i(s_vif.cyc),
    .s3_stb_i(s_vif.stb),
    .s3_ack_o(s_vif.ack),
    .s3_err_o(s_vif.err),
    .s3_rty_o(s_vif.rty),

    // Slave 4 Interface
    .s4_data_i(s_vif.data_in),
    .s4_data_o(s_vif.data_out),
    .s4_addr_i(s_vif.addr),
    .s4_sel_i(s_vif.sel),
    .s4_we_i(s_vif.we),
    .s4_cyc_i(s_vif.cyc),
    .s4_stb_i(s_vif.stb),
    .s4_ack_o(s_vif.ack),
    .s4_err_o(s_vif.err),
    .s4_rty_o(s_vif.rty),

    // Slave 5 Interface
    .s5_data_i(s_vif.data_in),
    .s5_data_o(s_vif.data_out),
    .s5_addr_i(s_vif.addr),
    .s5_sel_i(s_vif.sel),
    .s5_we_i(s_vif.we),
    .s5_cyc_i(s_vif.cyc),
    .s5_stb_i(s_vif.stb),
    .s5_ack_o(s_vif.ack),
    .s5_err_o(s_vif.err),
    .s5_rty_o(s_vif.rty),

    // Slave 6 Interface
    .s6_data_i(s_vif.data_in),
    .s6_data_o(s_vif.data_out),
    .s6_addr_i(s_vif.addr),
    .s6_sel_i(s_vif.sel),
    .s6_we_i(s_vif.we),
    .s6_cyc_i(s_vif.cyc),
    .s6_stb_i(s_vif.stb),
    .s6_ack_o(s_vif.ack),
    .s6_err_o(s_vif.err),
    .s6_rty_o(s_vif.rty),

    // Slave 7 Interface
    .s7_data_i(s_vif.data_in),
    .s7_data_o(s_vif.data_out),
    .s7_addr_i(s_vif.addr),
    .s7_sel_i(s_vif.sel),
    .s7_we_i(s_vif.we),
    .s7_cyc_i(s_vif.cyc),
    .s7_stb_i(s_vif.stb),
    .s7_ack_o(s_vif.ack),
    .s7_err_o(s_vif.err),
    .s7_rty_o(s_vif.rty),

    // Slave 8 Interface
    .s8_data_i(s_vif.data_in),
    .s8_data_o(s_vif.data_out),
    .s8_addr_i(s_vif.addr),
    .s8_sel_i(s_vif.sel),
    .s8_we_i(s_vif.we),
    .s8_cyc_i(s_vif.cyc),
    .s8_stb_i(s_vif.stb),
    .s8_ack_o(s_vif.ack),
    .s8_err_o(s_vif.err),
    .s8_rty_o(s_vif.rty),

    // Slave 9 Interface
    .s9_data_i(s_vif.data_in),
    .s9_data_o(s_vif.data_out),
    .s9_addr_i(s_vif.addr),
    .s9_sel_i(s_vif.sel),
    .s9_we_i(s_vif.we),
    .s9_cyc_i(s_vif.cyc),
    .s9_stb_i(s_vif.stb),
    .s9_ack_o(s_vif.ack),
    .s9_err_o(s_vif.err),
    .s9_rty_o(s_vif.rty),

    // Slave 10 Interface
    .s10_data_i(s_vif.data_in),
    .s10_data_o(s_vif.data_out),
    .s10_addr_i(s_vif.addr),
    .s10_sel_i(s_vif.sel),
    .s10_we_i(s_vif.we),
    .s10_cyc_i(s_vif.cyc),
    .s10_stb_i(s_vif.stb),
    .s10_ack_o(s_vif.ack),
    .s10_err_o(s_vif.err),
    .s10_rty_o(s_vif.rty),

    // Slave 11 Interface
    .s11_data_i(s_vif.data_in),
    .s11_data_o(s_vif.data_out),
    .s11_addr_i(s_vif.addr),
    .s11_sel_i(s_vif.sel),
    .s11_we_i(s_vif.we),
    .s11_cyc_i(s_vif.cyc),
    .s11_stb_i(s_vif.stb),
    .s11_ack_o(s_vif.ack),
    .s11_err_o(s_vif.err),
    .s11_rty_o(s_vif.rty),

    // Slave 12 Interface
    .s12_data_i(s_vif.data_in),
    .s12_data_o(s_vif.data_out),
    .s12_addr_i(s_vif.addr),
    .s12_sel_i(s_vif.sel),
    .s12_we_i(s_vif.we),
    .s12_cyc_i(s_vif.cyc),
    .s12_stb_i(s_vif.stb),
    .s12_ack_o(s_vif.ack),
    .s12_err_o(s_vif.err),
    .s12_rty_o(s_vif.rty),

    // Slave 13 Interface
    .s13_data_i(s_vif.data_in),
    .s13_data_o(s_vif.data_out),
    .s13_addr_i(s_vif.addr),
    .s13_sel_i(s_vif.sel),
    .s13_we_i(s_vif.we),
    .s13_cyc_i(s_vif.cyc),
    .s13_stb_i(s_vif.stb),
    .s13_ack_o(s_vif.ack),
    .s13_err_o(s_vif.err),
    .s13_rty_o(s_vif.rty),

    // Slave 14 Interface
    .s14_data_i(s_vif.data_in),
    .s14_data_o(s_vif.data_out),
    .s14_addr_i(s_vif.addr),
    .s14_sel_i(s_vif.sel),
    .s14_we_i(s_vif.we),
    .s14_cyc_i(s_vif.cyc),
    .s14_stb_i(s_vif.stb),
    .s14_ack_o(s_vif.ack),
    .s14_err_o(s_vif.err),
    .s14_rty_o(s_vif.rty),

    // Slave 15 Interface
    .s15_data_i(s_vif.data_in),
    .s15_data_o(s_vif.data_out),
    .s15_addr_i(s_vif.addr),
    .s15_sel_i(s_vif.sel),
    .s15_we_i(s_vif.we),
    .s15_cyc_i(s_vif.cyc),
    .s15_stb_i(s_vif.stb),
    .s15_ack_o(s_vif.ack),
    .s15_err_o(s_vif.err),
    .s15_rty_o(s_vif.rty)
    );
    
    //enabling the wave dump
    initial begin 
        uvm_config_db#(virtual base_if.master_if)::set(uvm_root::get(),"*","m_vif",m_vif);
        uvm_config_db#(virtual base_if.slave_if)::set(uvm_root::get(),"*","s_vif",s_vif);
        $dumpfile("dump.vcd"); 
        $dumpvars;
    end
    
    initial begin 
        run_test("base_test");
    end
endmodule: top