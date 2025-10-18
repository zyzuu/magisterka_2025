/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Top Level Test Bench                                       ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/wb_conmax/ ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: test_bench_top.v,v 1.2 2002-10-03 05:40:03 rudi Exp $
//
//  $Date: 2002-10-03 05:40:03 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1.1.1  2001/10/19 11:04:25  rudi
//               WISHBONE CONMAX IP Core
//
//
//
//
//
//


`include "wb_conmax_defines.v"

module test;

reg		clk;
reg		rst;

// IO Prototypes
wire	[31:0]	m0_data_i;
wire	[31:0]	m0_data_o;
wire	[31:0]	m0_addr_i;
wire	[3:0]	m0_sel_i;
wire		m0_we_i;
wire		m0_cyc_i;
wire		m0_stb_i;
wire		m0_ack_o;
wire		m0_err_o;
wire		m0_rty_o;
wire	[31:0]	m1_data_i;
wire	[31:0]	m1_data_o;
wire	[31:0]	m1_addr_i;
wire	[3:0]	m1_sel_i;
wire		m1_we_i;
wire		m1_cyc_i;
wire		m1_stb_i;
wire		m1_ack_o;
wire		m1_err_o;
wire		m1_rty_o;
wire	[31:0]	m2_data_i;
wire	[31:0]	m2_data_o;
wire	[31:0]	m2_addr_i;
wire	[3:0]	m2_sel_i;
wire		m2_we_i;
wire		m2_cyc_i;
wire		m2_stb_i;
wire		m2_ack_o;
wire		m2_err_o;
wire		m2_rty_o;
wire	[31:0]	m3_data_i;
wire	[31:0]	m3_data_o;
wire	[31:0]	m3_addr_i;
wire	[3:0]	m3_sel_i;
wire		m3_we_i;
wire		m3_cyc_i;
wire		m3_stb_i;
wire		m3_ack_o;
wire		m3_err_o;
wire		m3_rty_o;
wire	[31:0]	m4_data_i;
wire	[31:0]	m4_data_o;
wire	[31:0]	m4_addr_i;
wire	[3:0]	m4_sel_i;
wire		m4_we_i;
wire		m4_cyc_i;
wire		m4_stb_i;
wire		m4_ack_o;
wire		m4_err_o;
wire		m4_rty_o;
wire	[31:0]	m5_data_i;
wire	[31:0]	m5_data_o;
wire	[31:0]	m5_addr_i;
wire	[3:0]	m5_sel_i;
wire		m5_we_i;
wire		m5_cyc_i;
wire		m5_stb_i;
wire		m5_ack_o;
wire		m5_err_o;
wire		m5_rty_o;
wire	[31:0]	m6_data_i;
wire	[31:0]	m6_data_o;
wire	[31:0]	m6_addr_i;
wire	[3:0]	m6_sel_i;
wire		m6_we_i;
wire		m6_cyc_i;
wire		m6_stb_i;
wire		m6_ack_o;
wire		m6_err_o;
wire		m6_rty_o;
wire	[31:0]	m7_data_i;
wire	[31:0]	m7_data_o;
wire	[31:0]	m7_addr_i;
wire	[3:0]	m7_sel_i;
wire		m7_we_i;
wire		m7_cyc_i;
wire		m7_stb_i;
wire		m7_ack_o;
wire		m7_err_o;
wire		m7_rty_o;
wire	[31:0]	s0_data_i;
wire	[31:0]	s0_data_o;
wire	[31:0]	s0_addr_o;
wire	[3:0]	s0_sel_o;
wire		s0_we_o;
wire		s0_cyc_o;
wire		s0_stb_o;
wire		s0_ack_i;
wire		s0_err_i;
wire		s0_rty_i;
wire	[31:0]	s1_data_i;
wire	[31:0]	s1_data_o;
wire	[31:0]	s1_addr_o;
wire	[3:0]	s1_sel_o;
wire		s1_we_o;
wire		s1_cyc_o;
wire		s1_stb_o;
wire		s1_ack_i;
wire		s1_err_i;
wire		s1_rty_i;
wire	[31:0]	s2_data_i;
wire	[31:0]	s2_data_o;
wire	[31:0]	s2_addr_o;
wire	[3:0]	s2_sel_o;
wire		s2_we_o;
wire		s2_cyc_o;
wire		s2_stb_o;
wire		s2_ack_i;
wire		s2_err_i;
wire		s2_rty_i;
wire	[31:0]	s3_data_i;
wire	[31:0]	s3_data_o;
wire	[31:0]	s3_addr_o;
wire	[3:0]	s3_sel_o;
wire		s3_we_o;
wire		s3_cyc_o;
wire		s3_stb_o;
wire		s3_ack_i;
wire		s3_err_i;
wire		s3_rty_i;
wire	[31:0]	s4_data_i;
wire	[31:0]	s4_data_o;
wire	[31:0]	s4_addr_o;
wire	[3:0]	s4_sel_o;
wire		s4_we_o;
wire		s4_cyc_o;
wire		s4_stb_o;
wire		s4_ack_i;
wire		s4_err_i;
wire		s4_rty_i;
wire	[31:0]	s5_data_i;
wire	[31:0]	s5_data_o;
wire	[31:0]	s5_addr_o;
wire	[3:0]	s5_sel_o;
wire		s5_we_o;
wire		s5_cyc_o;
wire		s5_stb_o;
wire		s5_ack_i;
wire		s5_err_i;
wire		s5_rty_i;
wire	[31:0]	s6_data_i;
wire	[31:0]	s6_data_o;
wire	[31:0]	s6_addr_o;
wire	[3:0]	s6_sel_o;
wire		s6_we_o;
wire		s6_cyc_o;
wire		s6_stb_o;
wire		s6_ack_i;
wire		s6_err_i;
wire		s6_rty_i;
wire	[31:0]	s7_data_i;
wire	[31:0]	s7_data_o;
wire	[31:0]	s7_addr_o;
wire	[3:0]	s7_sel_o;
wire		s7_we_o;
wire		s7_cyc_o;
wire		s7_stb_o;
wire		s7_ack_i;
wire		s7_err_i;
wire		s7_rty_i;
wire	[31:0]	s8_data_i;
wire	[31:0]	s8_data_o;
wire	[31:0]	s8_addr_o;
wire	[3:0]	s8_sel_o;
wire		s8_we_o;
wire		s8_cyc_o;
wire		s8_stb_o;
wire		s8_ack_i;
wire		s8_err_i;
wire		s8_rty_i;
wire	[31:0]	s9_data_i;
wire	[31:0]	s9_data_o;
wire	[31:0]	s9_addr_o;
wire	[3:0]	s9_sel_o;
wire		s9_we_o;
wire		s9_cyc_o;
wire		s9_stb_o;
wire		s9_ack_i;
wire		s9_err_i;
wire		s9_rty_i;
wire	[31:0]	s10_data_i;
wire	[31:0]	s10_data_o;
wire	[31:0]	s10_addr_o;
wire	[3:0]	s10_sel_o;
wire		s10_we_o;
wire		s10_cyc_o;
wire		s10_stb_o;
wire		s10_ack_i;
wire		s10_err_i;
wire		s10_rty_i;
wire	[31:0]	s11_data_i;
wire	[31:0]	s11_data_o;
wire	[31:0]	s11_addr_o;
wire	[3:0]	s11_sel_o;
wire		s11_we_o;
wire		s11_cyc_o;
wire		s11_stb_o;
wire		s11_ack_i;
wire		s11_err_i;
wire		s11_rty_i;
wire	[31:0]	s12_data_i;
wire	[31:0]	s12_data_o;
wire	[31:0]	s12_addr_o;
wire	[3:0]	s12_sel_o;
wire		s12_we_o;
wire		s12_cyc_o;
wire		s12_stb_o;
wire		s12_ack_i;
wire		s12_err_i;
wire		s12_rty_i;
wire	[31:0]	s13_data_i;
wire	[31:0]	s13_data_o;
wire	[31:0]	s13_addr_o;
wire	[3:0]	s13_sel_o;
wire		s13_we_o;
wire		s13_cyc_o;
wire		s13_stb_o;
wire		s13_ack_i;
wire		s13_err_i;
wire		s13_rty_i;
wire	[31:0]	s14_data_i;
wire	[31:0]	s14_data_o;
wire	[31:0]	s14_addr_o;
wire	[3:0]	s14_sel_o;
wire		s14_we_o;
wire		s14_cyc_o;
wire		s14_stb_o;
wire		s14_ack_i;
wire		s14_err_i;
wire		s14_rty_i;
wire	[31:0]	s15_data_i;
wire	[31:0]	s15_data_o;
wire	[31:0]	s15_addr_o;
wire	[3:0]	s15_sel_o;
wire		s15_we_o;
wire		s15_cyc_o;
wire		s15_stb_o;
wire		s15_ack_i;
wire		s15_err_i;
wire		s15_rty_i;


// Test Bench Variables
reg	[31:0]	wd_cnt;
integer		error_cnt;
integer		verbose;

// Misc Variables

/////////////////////////////////////////////////////////////////////
//
// Defines
//


/////////////////////////////////////////////////////////////////////
//
// Simulation Initialization and Start up Section
//
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, test);
end

initial
   begin
	$timeformat (-9, 1, " ns", 10);

	$display("\n\n");
	$display("*****************************************************");
	$display("* WISHBONE Connection Matrix Simulation started ... *");
	$display("*****************************************************");
	$display("\n");

`ifdef WAVES
  	$shm_open("waves");
	$shm_probe("AS",test,"AS");
	$display("INFO: Signal dump enabled ...\n\n");
`endif
	wd_cnt = 0;
	error_cnt = 0;
   	clk = 1;
   	rst = 1;
	verbose = 1;

   	repeat(5)	@(posedge clk);
	s0.delay = 1;
	s1.delay = 1;
	s2.delay = 1;
	s3.delay = 1;
	s4.delay = 1;
	s5.delay = 1;
	s6.delay = 1;
	s7.delay = 1;
	s8.delay = 1;
	s9.delay = 1;
	s10.delay = 1;
	s11.delay = 1;
	s12.delay = 1;
	s13.delay = 1;
	s14.delay = 1;
	s15.delay = 1;
	#1;
   	rst = 0;
   	repeat(5)	@(posedge clk);

	// HERE IS WHERE THE TEST CASES GO ...

if(1)	// Full Regression Run
   begin
	$display(" ......................................................");
	$display(" :                                                    :");
	$display(" :    Regression Run ...                              :");
	$display(" :....................................................:");
	verbose = 0;

	test_dp1;
	test_rf;
	test_arb1;
	test_arb2;
	test_dp2;

   end
else
if(1)	// Debug Tests
   begin
	$display(" ......................................................");
	$display(" :                                                    :");
	$display(" :    Test Debug Testing ...                          :");
	$display(" :....................................................:");

	test_dp2;

   end

repeat(100)	@(posedge clk);
$finish;
end	// End of Initial

/////////////////////////////////////////////////////////////////////
//
// Clock Generation
//

always #5	clk = ~clk;

/////////////////////////////////////////////////////////////////////
//
// Watchdog Counter
//

always @(posedge clk)
	if(m0_ack_o | m1_ack_o | m2_ack_o | m3_ack_o |
		m4_ack_o | m5_ack_o | m6_ack_o | m7_ack_o)
		wd_cnt = 0;
	else
		wd_cnt = wd_cnt +1;

always @(wd_cnt)
	if(wd_cnt > 5000)
	   begin
		$display("\n*******************************************");
		$display("*** ERROR: Watchdog Counter Expired ... ***");
		$display("*******************************************\n");
		$finish;
	   end

/////////////////////////////////////////////////////////////////////
//
// IO Monitors
//

/////////////////////////////////////////////////////////////////////
//
// WISHBONE Inter Connect
//

wb_conmax_top	#(32,
		32,
		4'hf,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2
		) conmax(
		.clk_i(		clk		),
		.rst_i(		rst		),
		.m0_data_i(	m0_data_i	),
		.m0_data_o(	m0_data_o	),
		.m0_addr_i(	m0_addr_i	),
		.m0_sel_i(	m0_sel_i	),
		.m0_we_i(	m0_we_i		),
		.m0_cyc_i(	m0_cyc_i	),
		.m0_stb_i(	m0_stb_i	),
		.m0_ack_o(	m0_ack_o	),
		.m0_err_o(	m0_err_o	),
		.m0_rty_o(	m0_rty_o	),
		.m1_data_i(	m1_data_i	),
		.m1_data_o(	m1_data_o	),
		.m1_addr_i(	m1_addr_i	),
		.m1_sel_i(	m1_sel_i	),
		.m1_we_i(	m1_we_i		),
		.m1_cyc_i(	m1_cyc_i	),
		.m1_stb_i(	m1_stb_i	),
		.m1_ack_o(	m1_ack_o	),
		.m1_err_o(	m1_err_o	),
		.m1_rty_o(	m1_rty_o	),
		.m2_data_i(	m2_data_i	),
		.m2_data_o(	m2_data_o	),
		.m2_addr_i(	m2_addr_i	),
		.m2_sel_i(	m2_sel_i	),
		.m2_we_i(	m2_we_i		),
		.m2_cyc_i(	m2_cyc_i	),
		.m2_stb_i(	m2_stb_i	),
		.m2_ack_o(	m2_ack_o	),
		.m2_err_o(	m2_err_o	),
		.m2_rty_o(	m2_rty_o	),
		.m3_data_i(	m3_data_i	),
		.m3_data_o(	m3_data_o	),
		.m3_addr_i(	m3_addr_i	),
		.m3_sel_i(	m3_sel_i	),
		.m3_we_i(	m3_we_i		),
		.m3_cyc_i(	m3_cyc_i	),
		.m3_stb_i(	m3_stb_i	),
		.m3_ack_o(	m3_ack_o	),
		.m3_err_o(	m3_err_o	),
		.m3_rty_o(	m3_rty_o	),
		.m4_data_i(	m4_data_i	),
		.m4_data_o(	m4_data_o	),
		.m4_addr_i(	m4_addr_i	),
		.m4_sel_i(	m4_sel_i	),
		.m4_we_i(	m4_we_i		),
		.m4_cyc_i(	m4_cyc_i	),
		.m4_stb_i(	m4_stb_i	),
		.m4_ack_o(	m4_ack_o	),
		.m4_err_o(	m4_err_o	),
		.m4_rty_o(	m4_rty_o	),
		.m5_data_i(	m5_data_i	),
		.m5_data_o(	m5_data_o	),
		.m5_addr_i(	m5_addr_i	),
		.m5_sel_i(	m5_sel_i	),
		.m5_we_i(	m5_we_i		),
		.m5_cyc_i(	m5_cyc_i	),
		.m5_stb_i(	m5_stb_i	),
		.m5_ack_o(	m5_ack_o	),
		.m5_err_o(	m5_err_o	),
		.m5_rty_o(	m5_rty_o	),
		.m6_data_i(	m6_data_i	),
		.m6_data_o(	m6_data_o	),
		.m6_addr_i(	m6_addr_i	),
		.m6_sel_i(	m6_sel_i	),
		.m6_we_i(	m6_we_i		),
		.m6_cyc_i(	m6_cyc_i	),
		.m6_stb_i(	m6_stb_i	),
		.m6_ack_o(	m6_ack_o	),
		.m6_err_o(	m6_err_o	),
		.m6_rty_o(	m6_rty_o	),
		.m7_data_i(	m7_data_i	),
		.m7_data_o(	m7_data_o	),
		.m7_addr_i(	m7_addr_i	),
		.m7_sel_i(	m7_sel_i	),
		.m7_we_i(	m7_we_i		),
		.m7_cyc_i(	m7_cyc_i	),
		.m7_stb_i(	m7_stb_i	),
		.m7_ack_o(	m7_ack_o	),
		.m7_err_o(	m7_err_o	),
		.m7_rty_o(	m7_rty_o	),
		.s0_data_i(	s0_data_i	),
		.s0_data_o(	s0_data_o	),
		.s0_addr_o(	s0_addr_o	),
		.s0_sel_o(	s0_sel_o	),
		.s0_we_o(	s0_we_o		),
		.s0_cyc_o(	s0_cyc_o	),
		.s0_stb_o(	s0_stb_o	),
		.s0_ack_i(	s0_ack_i	),
		.s0_err_i(	s0_err_i	),
		.s0_rty_i(	s0_rty_i	),
		.s1_data_i(	s1_data_i	),
		.s1_data_o(	s1_data_o	),
		.s1_addr_o(	s1_addr_o	),
		.s1_sel_o(	s1_sel_o	),
		.s1_we_o(	s1_we_o		),
		.s1_cyc_o(	s1_cyc_o	),
		.s1_stb_o(	s1_stb_o	),
		.s1_ack_i(	s1_ack_i	),
		.s1_err_i(	s1_err_i	),
		.s1_rty_i(	s1_rty_i	),
		.s2_data_i(	s2_data_i	),
		.s2_data_o(	s2_data_o	),
		.s2_addr_o(	s2_addr_o	),
		.s2_sel_o(	s2_sel_o	),
		.s2_we_o(	s2_we_o		),
		.s2_cyc_o(	s2_cyc_o	),
		.s2_stb_o(	s2_stb_o	),
		.s2_ack_i(	s2_ack_i	),
		.s2_err_i(	s2_err_i	),
		.s2_rty_i(	s2_rty_i	),
		.s3_data_i(	s3_data_i	),
		.s3_data_o(	s3_data_o	),
		.s3_addr_o(	s3_addr_o	),
		.s3_sel_o(	s3_sel_o	),
		.s3_we_o(	s3_we_o		),
		.s3_cyc_o(	s3_cyc_o	),
		.s3_stb_o(	s3_stb_o	),
		.s3_ack_i(	s3_ack_i	),
		.s3_err_i(	s3_err_i	),
		.s3_rty_i(	s3_rty_i	),
		.s4_data_i(	s4_data_i	),
		.s4_data_o(	s4_data_o	),
		.s4_addr_o(	s4_addr_o	),
		.s4_sel_o(	s4_sel_o	),
		.s4_we_o(	s4_we_o		),
		.s4_cyc_o(	s4_cyc_o	),
		.s4_stb_o(	s4_stb_o	),
		.s4_ack_i(	s4_ack_i	),
		.s4_err_i(	s4_err_i	),
		.s4_rty_i(	s4_rty_i	),
		.s5_data_i(	s5_data_i	),
		.s5_data_o(	s5_data_o	),
		.s5_addr_o(	s5_addr_o	),
		.s5_sel_o(	s5_sel_o	),
		.s5_we_o(	s5_we_o		),
		.s5_cyc_o(	s5_cyc_o	),
		.s5_stb_o(	s5_stb_o	),
		.s5_ack_i(	s5_ack_i	),
		.s5_err_i(	s5_err_i	),
		.s5_rty_i(	s5_rty_i	),
		.s6_data_i(	s6_data_i	),
		.s6_data_o(	s6_data_o	),
		.s6_addr_o(	s6_addr_o	),
		.s6_sel_o(	s6_sel_o	),
		.s6_we_o(	s6_we_o		),
		.s6_cyc_o(	s6_cyc_o	),
		.s6_stb_o(	s6_stb_o	),
		.s6_ack_i(	s6_ack_i	),
		.s6_err_i(	s6_err_i	),
		.s6_rty_i(	s6_rty_i	),
		.s7_data_i(	s7_data_i	),
		.s7_data_o(	s7_data_o	),
		.s7_addr_o(	s7_addr_o	),
		.s7_sel_o(	s7_sel_o	),
		.s7_we_o(	s7_we_o		),
		.s7_cyc_o(	s7_cyc_o	),
		.s7_stb_o(	s7_stb_o	),
		.s7_ack_i(	s7_ack_i	),
		.s7_err_i(	s7_err_i	),
		.s7_rty_i(	s7_rty_i	),
		.s8_data_i(	s8_data_i	),
		.s8_data_o(	s8_data_o	),
		.s8_addr_o(	s8_addr_o	),
		.s8_sel_o(	s8_sel_o	),
		.s8_we_o(	s8_we_o		),
		.s8_cyc_o(	s8_cyc_o	),
		.s8_stb_o(	s8_stb_o	),
		.s8_ack_i(	s8_ack_i	),
		.s8_err_i(	s8_err_i	),
		.s8_rty_i(	s8_rty_i	),
		.s9_data_i(	s9_data_i	),
		.s9_data_o(	s9_data_o	),
		.s9_addr_o(	s9_addr_o	),
		.s9_sel_o(	s9_sel_o	),
		.s9_we_o(	s9_we_o		),
		.s9_cyc_o(	s9_cyc_o	),
		.s9_stb_o(	s9_stb_o	),
		.s9_ack_i(	s9_ack_i	),
		.s9_err_i(	s9_err_i	),
		.s9_rty_i(	s9_rty_i	),
		.s10_data_i(	s10_data_i	),
		.s10_data_o(	s10_data_o	),
		.s10_addr_o(	s10_addr_o	),
		.s10_sel_o(	s10_sel_o	),
		.s10_we_o(	s10_we_o	),
		.s10_cyc_o(	s10_cyc_o	),
		.s10_stb_o(	s10_stb_o	),
		.s10_ack_i(	s10_ack_i	),
		.s10_err_i(	s10_err_i	),
		.s10_rty_i(	s10_rty_i	),
		.s11_data_i(	s11_data_i	),
		.s11_data_o(	s11_data_o	),
		.s11_addr_o(	s11_addr_o	),
		.s11_sel_o(	s11_sel_o	),
		.s11_we_o(	s11_we_o	),
		.s11_cyc_o(	s11_cyc_o	),
		.s11_stb_o(	s11_stb_o	),
		.s11_ack_i(	s11_ack_i	),
		.s11_err_i(	s11_err_i	),
		.s11_rty_i(	s11_rty_i	),
		.s12_data_i(	s12_data_i	),
		.s12_data_o(	s12_data_o	),
		.s12_addr_o(	s12_addr_o	),
		.s12_sel_o(	s12_sel_o	),
		.s12_we_o(	s12_we_o	),
		.s12_cyc_o(	s12_cyc_o	),
		.s12_stb_o(	s12_stb_o	),
		.s12_ack_i(	s12_ack_i	),
		.s12_err_i(	s12_err_i	),
		.s12_rty_i(	s12_rty_i	),
		.s13_data_i(	s13_data_i	),
		.s13_data_o(	s13_data_o	),
		.s13_addr_o(	s13_addr_o	),
		.s13_sel_o(	s13_sel_o	),
		.s13_we_o(	s13_we_o	),
		.s13_cyc_o(	s13_cyc_o	),
		.s13_stb_o(	s13_stb_o	),
		.s13_ack_i(	s13_ack_i	),
		.s13_err_i(	s13_err_i	),
		.s13_rty_i(	s13_rty_i	),
		.s14_data_i(	s14_data_i	),
		.s14_data_o(	s14_data_o	),
		.s14_addr_o(	s14_addr_o	),
		.s14_sel_o(	s14_sel_o	),
		.s14_we_o(	s14_we_o	),
		.s14_cyc_o(	s14_cyc_o	),
		.s14_stb_o(	s14_stb_o	),
		.s14_ack_i(	s14_ack_i	),
		.s14_err_i(	s14_err_i	),
		.s14_rty_i(	s14_rty_i	),
		.s15_data_i(	s15_data_i	),
		.s15_data_o(	s15_data_o	),
		.s15_addr_o(	s15_addr_o	),
		.s15_sel_o(	s15_sel_o	),
		.s15_we_o(	s15_we_o	),
		.s15_cyc_o(	s15_cyc_o	),
		.s15_stb_o(	s15_stb_o	),
		.s15_ack_i(	s15_ack_i	),
		.s15_err_i(	s15_err_i	),
		.s15_rty_i(	s15_rty_i	)
		);


/////////////////////////////////////////////////////////////////////
//
// WISHBONE Master Models
//

wb_mast	m0(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m0_addr_i	),
		.din(		m0_data_o	),
		.dout(		m0_data_i	),
		.cyc(		m0_cyc_i	),
		.stb(		m0_stb_i	),
		.sel(		m0_sel_i	),
		.we(		m0_we_i		),
		.ack(		m0_ack_o	),
		.err(		m0_err_o	),
		.rty(		m0_rty_o	)
		);

wb_mast	m1(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m1_addr_i	),
		.din(		m1_data_o	),
		.dout(		m1_data_i	),
		.cyc(		m1_cyc_i	),
		.stb(		m1_stb_i	),
		.sel(		m1_sel_i	),
		.we(		m1_we_i		),
		.ack(		m1_ack_o	),
		.err(		m1_err_o	),
		.rty(		m1_rty_o	)
		);

wb_mast	m2(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m2_addr_i	),
		.din(		m2_data_o	),
		.dout(		m2_data_i	),
		.cyc(		m2_cyc_i	),
		.stb(		m2_stb_i	),
		.sel(		m2_sel_i	),
		.we(		m2_we_i		),
		.ack(		m2_ack_o	),
		.err(		m2_err_o	),
		.rty(		m2_rty_o	)
		);

wb_mast	m3(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m3_addr_i	),
		.din(		m3_data_o	),
		.dout(		m3_data_i	),
		.cyc(		m3_cyc_i	),
		.stb(		m3_stb_i	),
		.sel(		m3_sel_i	),
		.we(		m3_we_i		),
		.ack(		m3_ack_o	),
		.err(		m3_err_o	),
		.rty(		m3_rty_o	)
		);

wb_mast	m4(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m4_addr_i	),
		.din(		m4_data_o	),
		.dout(		m4_data_i	),
		.cyc(		m4_cyc_i	),
		.stb(		m4_stb_i	),
		.sel(		m4_sel_i	),
		.we(		m4_we_i		),
		.ack(		m4_ack_o	),
		.err(		m4_err_o	),
		.rty(		m4_rty_o	)
		);

wb_mast	m5(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m5_addr_i	),
		.din(		m5_data_o	),
		.dout(		m5_data_i	),
		.cyc(		m5_cyc_i	),
		.stb(		m5_stb_i	),
		.sel(		m5_sel_i	),
		.we(		m5_we_i		),
		.ack(		m5_ack_o	),
		.err(		m5_err_o	),
		.rty(		m5_rty_o	)
		);

wb_mast	m6(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m6_addr_i	),
		.din(		m6_data_o	),
		.dout(		m6_data_i	),
		.cyc(		m6_cyc_i	),
		.stb(		m6_stb_i	),
		.sel(		m6_sel_i	),
		.we(		m6_we_i		),
		.ack(		m6_ack_o	),
		.err(		m6_err_o	),
		.rty(		m6_rty_o	)
		);

wb_mast	m7(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		m7_addr_i	),
		.din(		m7_data_o	),
		.dout(		m7_data_i	),
		.cyc(		m7_cyc_i	),
		.stb(		m7_stb_i	),
		.sel(		m7_sel_i	),
		.we(		m7_we_i		),
		.ack(		m7_ack_o	),
		.err(		m7_err_o	),
		.rty(		m7_rty_o	)
		);


/////////////////////////////////////////////////////////////////////
//
// WISHBONE Slave Models
//

wb_slv  s0(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s0_addr_o	),
		.din(		s0_data_o	),
		.dout(		s0_data_i	),
		.cyc(		s0_cyc_o	),
		.stb(		s0_stb_o	),
		.sel(		s0_sel_o	),
		.we(		s0_we_o		),
		.ack(		s0_ack_i	),
		.err(		s0_err_i	),
		.rty(		s0_rty_i	)
		);

wb_slv  s1(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s1_addr_o	),
		.din(		s1_data_o	),
		.dout(		s1_data_i	),
		.cyc(		s1_cyc_o	),
		.stb(		s1_stb_o	),
		.sel(		s1_sel_o	),
		.we(		s1_we_o		),
		.ack(		s1_ack_i	),
		.err(		s1_err_i	),
		.rty(		s1_rty_i	)
		);

wb_slv  s2(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s2_addr_o	),
		.din(		s2_data_o	),
		.dout(		s2_data_i	),
		.cyc(		s2_cyc_o	),
		.stb(		s2_stb_o	),
		.sel(		s2_sel_o	),
		.we(		s2_we_o		),
		.ack(		s2_ack_i	),
		.err(		s2_err_i	),
		.rty(		s2_rty_i	)
		);

wb_slv  s3(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s3_addr_o	),
		.din(		s3_data_o	),
		.dout(		s3_data_i	),
		.cyc(		s3_cyc_o	),
		.stb(		s3_stb_o	),
		.sel(		s3_sel_o	),
		.we(		s3_we_o		),
		.ack(		s3_ack_i	),
		.err(		s3_err_i	),
		.rty(		s3_rty_i	)
		);

wb_slv  s4(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s4_addr_o	),
		.din(		s4_data_o	),
		.dout(		s4_data_i	),
		.cyc(		s4_cyc_o	),
		.stb(		s4_stb_o	),
		.sel(		s4_sel_o	),
		.we(		s4_we_o		),
		.ack(		s4_ack_i	),
		.err(		s4_err_i	),
		.rty(		s4_rty_i	)
		);

wb_slv  s5(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s5_addr_o	),
		.din(		s5_data_o	),
		.dout(		s5_data_i	),
		.cyc(		s5_cyc_o	),
		.stb(		s5_stb_o	),
		.sel(		s5_sel_o	),
		.we(		s5_we_o		),
		.ack(		s5_ack_i	),
		.err(		s5_err_i	),
		.rty(		s5_rty_i	)
		);

wb_slv  s6(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s6_addr_o	),
		.din(		s6_data_o	),
		.dout(		s6_data_i	),
		.cyc(		s6_cyc_o	),
		.stb(		s6_stb_o	),
		.sel(		s6_sel_o	),
		.we(		s6_we_o		),
		.ack(		s6_ack_i	),
		.err(		s6_err_i	),
		.rty(		s6_rty_i	)
		);

wb_slv  s7(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s7_addr_o	),
		.din(		s7_data_o	),
		.dout(		s7_data_i	),
		.cyc(		s7_cyc_o	),
		.stb(		s7_stb_o	),
		.sel(		s7_sel_o	),
		.we(		s7_we_o		),
		.ack(		s7_ack_i	),
		.err(		s7_err_i	),
		.rty(		s7_rty_i	)
		);

wb_slv  s8(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s8_addr_o	),
		.din(		s8_data_o	),
		.dout(		s8_data_i	),
		.cyc(		s8_cyc_o	),
		.stb(		s8_stb_o	),
		.sel(		s8_sel_o	),
		.we(		s8_we_o		),
		.ack(		s8_ack_i	),
		.err(		s8_err_i	),
		.rty(		s8_rty_i	)
		);

wb_slv  s9(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s9_addr_o	),
		.din(		s9_data_o	),
		.dout(		s9_data_i	),
		.cyc(		s9_cyc_o	),
		.stb(		s9_stb_o	),
		.sel(		s9_sel_o	),
		.we(		s9_we_o		),
		.ack(		s9_ack_i	),
		.err(		s9_err_i	),
		.rty(		s9_rty_i	)
		);

wb_slv  s10(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s10_addr_o	),
		.din(		s10_data_o	),
		.dout(		s10_data_i	),
		.cyc(		s10_cyc_o	),
		.stb(		s10_stb_o	),
		.sel(		s10_sel_o	),
		.we(		s10_we_o	),
		.ack(		s10_ack_i	),
		.err(		s10_err_i	),
		.rty(		s10_rty_i	)
		);

wb_slv  s11(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s11_addr_o	),
		.din(		s11_data_o	),
		.dout(		s11_data_i	),
		.cyc(		s11_cyc_o	),
		.stb(		s11_stb_o	),
		.sel(		s11_sel_o	),
		.we(		s11_we_o	),
		.ack(		s11_ack_i	),
		.err(		s11_err_i	),
		.rty(		s11_rty_i	)
		);

wb_slv  s12(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s12_addr_o	),
		.din(		s12_data_o	),
		.dout(		s12_data_i	),
		.cyc(		s12_cyc_o	),
		.stb(		s12_stb_o	),
		.sel(		s12_sel_o	),
		.we(		s12_we_o	),
		.ack(		s12_ack_i	),
		.err(		s12_err_i	),
		.rty(		s12_rty_i	)
		);

wb_slv  s13(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s13_addr_o	),
		.din(		s13_data_o	),
		.dout(		s13_data_i	),
		.cyc(		s13_cyc_o	),
		.stb(		s13_stb_o	),
		.sel(		s13_sel_o	),
		.we(		s13_we_o	),
		.ack(		s13_ack_i	),
		.err(		s13_err_i	),
		.rty(		s13_rty_i	)
		);

wb_slv  s14(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s14_addr_o	),
		.din(		s14_data_o	),
		.dout(		s14_data_i	),
		.cyc(		s14_cyc_o	),
		.stb(		s14_stb_o	),
		.sel(		s14_sel_o	),
		.we(		s14_we_o	),
		.ack(		s14_ack_i	),
		.err(		s14_err_i	),
		.rty(		s14_rty_i	)
		);

wb_slv  s15(	.clk(		clk		),
		.rst(		~rst		),
		.adr(		s15_addr_o	),
		.din(		s15_data_o	),
		.dout(		s15_data_i	),
		.cyc(		s15_cyc_o	),
		.stb(		s15_stb_o	),
		.sel(		s15_sel_o	),
		.we(		s15_we_o	),
		.ack(		s15_ack_i	),
		.err(		s15_err_i	),
		.rty(		s15_rty_i	)
		);

    /////////////////////////////////////////////////////////////////////
    ////                                                             ////
    ////  WISHBONE Connection Matrix Test Cases                      ////
    ////                                                             ////
    ////                                                             ////
    ////  Author: Rudolf Usselmann                                   ////
    ////          rudi@asics.ws                                      ////
    ////                                                             ////
    ////                                                             ////
    ////  Downloaded from: http://www.opencores.org/cores/wb_dma/    ////
    ////                                                             ////
    /////////////////////////////////////////////////////////////////////
    ////                                                             ////
    //// Copyright (C) 2000 Rudolf Usselmann                         ////
    ////                    rudi@asics.ws                            ////
    ////                                                             ////
    //// This source file may be used and distributed without        ////
    //// restriction provided that this copyright statement is not   ////
    //// removed from the file and that any derivative work contains ////
    //// the original copyright notice and the associated disclaimer.////
    ////                                                             ////
    ////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
    //// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
    //// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
    //// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
    //// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
    //// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
    //// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
    //// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
    //// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
    //// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
    //// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
    //// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
    //// POSSIBILITY OF SUCH DAMAGE.                                 ////
    ////                                                             ////
    /////////////////////////////////////////////////////////////////////

    //  CVS Log
    //
    //  $Id: tests.v,v 1.1.1.1 2001-10-19 11:04:27 rudi Exp $
    //
    //  $Date: 2001-10-19 11:04:27 $
    //  $Revision: 1.1.1.1 $
    //  $Author: rudi $
    //  $Locker:  $
    //  $State: Exp $
    //
    // Change History:
    //               $Log: not supported by cvs2svn $
    //
    //
    //
    //
    //


    task show_errors;

    begin

    $display("\n");
    $display("     +--------------------+");
    $display("     |  Total ERRORS: %0d   |", error_cnt);
    $display("     +--------------------+");

    end
    endtask


    task init_all_mem;

    begin
    	s0.fill_mem(1);
    	s1.fill_mem(1);
    	s2.fill_mem(1);
    	s3.fill_mem(1);
    	s4.fill_mem(1);
    	s5.fill_mem(1);
    	s6.fill_mem(1);
    	s7.fill_mem(1);
    	s8.fill_mem(1);
    	s9.fill_mem(1);
    	s10.fill_mem(1);
    	s11.fill_mem(1);
    	s12.fill_mem(1);
    	s13.fill_mem(1);
    	s14.fill_mem(1);
    	s15.fill_mem(1);

    	m0.mem_fill;
    	m1.mem_fill;
    	m2.mem_fill;
    	m3.mem_fill;
    	m4.mem_fill;
    	m5.mem_fill;
    	m6.mem_fill;
    	m7.mem_fill;

    end
    endtask


    task verify;
    input	master;
    input	slave;
    input	count;

    integer		master, slave, count;
    begin
    verify_sub(master,slave,count,0,0);
    end
    endtask


    task verify_sub;
    input	master;
    input	slave;
    input	count;
    input	mo;
    input	so;

    integer		master, slave, count;
    integer		mo, so;
    integer		o;
    integer		n;
    reg	[31:0]	mdata, sdata;

    begin

    //$display("V2: %0d %0d %0d %0d %0d",master, slave, count, mo,so);

    for(n=0;n<count;n=n+1)
       begin
    	case(master)
    	   0: mdata = m0.mem[n+mo];
    	   1: mdata = m1.mem[n+mo];
    	   2: mdata = m2.mem[n+mo];
    	   3: mdata = m3.mem[n+mo];
    	   4: mdata = m4.mem[n+mo];
    	   5: mdata = m5.mem[n+mo];
    	   6: mdata = m6.mem[n+mo];
    	   7: mdata = m7.mem[n+mo];
    	   default:
    		begin
    		$display("ERROR: Illegal Master %0d", master);
    		$finish;
    		end
    	endcase

    	o = 0;
    	case(master)
    	   0: o = 16'h000;
    	   1: o = 16'h040;
    	   2: o = 16'h080;
    	   3: o = 16'h0c0;
    	   4: o = 16'h100;
    	   5: o = 16'h140;
    	   6: o = 16'h180;
    	   7: o = 16'h1c0;
    	endcase

    	case(slave)
    	   0: sdata = s0.mem[n+o+so];
    	   1: sdata = s1.mem[n+o+so];
    	   2: sdata = s2.mem[n+o+so];
    	   3: sdata = s3.mem[n+o+so];
    	   4: sdata = s4.mem[n+o+so];
    	   5: sdata = s5.mem[n+o+so];
    	   6: sdata = s6.mem[n+o+so];
    	   7: sdata = s7.mem[n+o+so];
    	   8: sdata = s8.mem[n+o+so];
    	   9: sdata = s9.mem[n+o+so];
    	   10: sdata = s10.mem[n+o+so];
    	   11: sdata = s11.mem[n+o+so];
    	   12: sdata = s12.mem[n+o+so];
    	   13: sdata = s13.mem[n+o+so];
    	   14: sdata = s14.mem[n+o+so];
    	   15: sdata = s15.mem[n+o+so];
    	   default:
    		begin
    		$display("ERROR: Illegal Slave %0d", slave);
    		$finish;
    		end
    	endcase

    	//$display("INFO: Master[%0d]: %h - Slave[%0d]: %h (%0t)",
    	//	master, mdata, slave, sdata, $time);

    	if(mdata !== sdata)
    	   begin
    		$display("ERROR: Master[%0d][%0d]: %h - Slave[%0d]: %h (%0t)",
    		master, n, mdata, slave, sdata, $time);
    		error_cnt = error_cnt + 1;
    	   end
       end
    end

    endtask


    task test_arb1;

    integer	n, del;
    reg	[31:0]	data;

    begin

    	$display("\n\n");
    	$display("*****************************************************");
    	$display("*** Arb. 1 Test ...                               ***");
    	$display("*****************************************************\n");

    del = 4;
    for(del = 0;del < 5; del=del+1 )
       begin
    	$display("Delay: %0d", del);
    	init_all_mem;
    	m1.wb_wr1( 32'hff00_0000, 4'hf, 32'h0000_a5ff);

    	fork
    	   begin
    		m0.wb_rd_mult( 32'h0000_0000 + (0 << 28), 4'hf, del, 4);
    		m0.wb_rd1( 32'hff00_0000, 4'hf, data);
    		if(data !== 32'h0000_a5ff)
    		   begin
    			$display("ERROR: RF read mismatch: Exp. 0, Got %h", data);
    			error_cnt = error_cnt + 1;
    		   end
    		m0.wb_wr_mult( 32'h0000_0010 + (0 << 28), 4'hf, del, 4);
    		m0.wb_rd_mult( 32'h0000_0020 + (0 << 28), 4'hf, del, 4);
    		m0.wb_wr_mult( 32'h0000_0030 + (0 << 28), 4'hf, del, 4);
    	   end

    	   begin
    		m1.wb_wr_mult( 32'h0000_0100 + (0 << 28), 4'hf, del, 4);
    		m1.wb_rd_mult( 32'h0000_0110 + (0 << 28), 4'hf, del, 4);
    		m1.wb_rd1( 32'hff00_0000, 4'hf, data);
    		if(data !== 32'h0000_a5ff)
    		   begin
    			$display("ERROR: RF read mismatch: Exp. 0, Got %h", data);
    			error_cnt = error_cnt + 1;
    		   end
    		m1.wb_wr_mult( 32'h0000_0120 + (0 << 28), 4'hf, del, 4);
    		m1.wb_rd_mult( 32'h0000_0130 + (0 << 28), 4'hf, del, 4);
    	   end

    	   begin
    		m2.wb_rd_mult( 32'h0000_0200 + (0 << 28), 4'hf, del, 4);
    		m2.wb_wr_mult( 32'h0000_0210 + (0 << 28), 4'hf, del, 4);
    		m2.wb_rd_mult( 32'h0000_0220 + (0 << 28), 4'hf, del, 4);
    		m2.wb_rd1( 32'hff00_0000, 4'hf, data);
    		if(data !== 32'h0000_a5ff)
    		   begin
    			$display("ERROR: RF read mismatch: Exp. 0, Got %h", data);
    			error_cnt = error_cnt + 1;
    		   end
    		m2.wb_wr_mult( 32'h0000_0230 + (0 << 28), 4'hf, del, 4);
    	   end

    	   begin
    		m3.wb_wr_mult( 32'h0000_0300 + (0 << 28), 4'hf, del, 4);
    		m3.wb_rd_mult( 32'h0000_0310 + (0 << 28), 4'hf, del, 4);
    		m3.wb_wr_mult( 32'h0000_0320 + (0 << 28), 4'hf, del, 4);
    		m3.wb_rd_mult( 32'h0000_0330 + (0 << 28), 4'hf, del, 4);
    		m3.wb_rd1( 32'hff00_0000, 4'hf, data);
    		if(data !== 32'h0000_a5ff)
    		   begin
    			$display("ERROR: RF read mismatch: Exp. a5ff, Got %h", data);
    			error_cnt = error_cnt + 1;
    		   end
    	   end

    	   begin
    		m4.wb_rd_mult( 32'h0000_0400 + (1 << 28), 4'hf, del, 4);
    		m4.wb_wr_mult( 32'h0000_0410 + (1 << 28), 4'hf, del, 4);
    		m4.wb_rd_mult( 32'h0000_0420 + (1 << 28), 4'hf, del, 4);
    		m4.wb_wr_mult( 32'h0000_0430 + (1 << 28), 4'hf, del, 4);
    	   end

    	   begin
    		m5.wb_rd_mult( 32'h0000_0500 + (1 << 28), 4'hf, del, 4);
    		m5.wb_wr_mult( 32'h0000_0510 + (1 << 28), 4'hf, del, 4);
    		m5.wb_rd_mult( 32'h0000_0520 + (1 << 28), 4'hf, del, 4);
    		m5.wb_wr_mult( 32'h0000_0530 + (1 << 28), 4'hf, del, 4);
    	   end

    	   begin
    		m6.wb_wr_mult( 32'h0000_0600 + (15 << 28), 4'hf, del, 4);
    		m6.wb_rd_mult( 32'h0000_0610 + (15 << 28), 4'hf, del, 4);
    		m6.wb_wr_mult( 32'h0000_0620 + (15 << 28), 4'hf, del, 4);
    		m6.wb_rd_mult( 32'h0000_0630 + (15 << 28), 4'hf, del, 4);
    	   end

    	   begin
    		m7.wb_wr_mult( 32'h0000_0700 + (15 << 28), 4'hf, del, 4);
    		m7.wb_rd_mult( 32'h0000_0710 + (15 << 28), 4'hf, del, 4);
    		m7.wb_wr_mult( 32'h0000_0720 + (15 << 28), 4'hf, del, 4);
    		m7.wb_rd_mult( 32'h0000_0730 + (15 << 28), 4'hf, del, 4);
    	   end
    	join

    	verify(0,0,16);
    	verify(1,0,16);
    	verify(2,0,16);
    	verify(3,0,16);
    	verify(4,1,16);
    	verify(5,1,16);
    	verify(6,15,16);
    	verify(7,15,16);
       end
    	show_errors;
    	$display("*****************************************************");
    	$display("*** Test DONE ...                                 ***");
    	$display("*****************************************************\n\n");

    end
    endtask


    task test_arb2;

    integer		m, del, siz;
    integer		n, a, b;
    time		t[0:7];
    reg	[1:0]	p[0:7];

    begin

    	$display("\n\n");
    	$display("*****************************************************");
    	$display("*** Arb. 2 Test ...                               ***");
    	$display("*****************************************************\n");


    siz = 4;
    del = 0;
    m=0;
    for(m=0;m<32;m=m+1)
    for(del=0;del<7;del=del+1)
    for(siz=1;siz<5;siz=siz+1)
       begin

    	init_all_mem;
    	$display("Mode: %0d del: %0d, siz: %0d", m, del, siz);

    	case(m)
    	   0:
    		begin
    		p[7] = 2'd3;	// M 7
    		p[6] = 2'd1;	// M 6
    		p[5] = 2'd2;	// M 5
    		p[4] = 2'd3;	// M 4
    		p[3] = 2'd0;	// M 3
    		p[2] = 2'd1;	// M 2
    		p[1] = 2'd0;	// M 1
    		p[0] = 2'd2;	// M 0
    		end

    	    4:
    		begin
    		p[7] = 2'd0;	// M 7
    		p[6] = 2'd1;	// M 6
    		p[5] = 2'd2;	// M 5
    		p[4] = 2'd3;	// M 4
    		p[3] = 2'd3;	// M 3
    		p[2] = 2'd2;	// M 2
    		p[1] = 2'd1;	// M 1
    		p[0] = 2'd0;	// M 0
    		end

    	    8:
    		begin
    		p[7] = 2'd3;	// M 7
    		p[6] = 2'd2;	// M 6
    		p[5] = 2'd1;	// M 5
    		p[4] = 2'd0;	// M 4
    		p[3] = 2'd0;	// M 3
    		p[2] = 2'd1;	// M 2
    		p[1] = 2'd2;	// M 1
    		p[0] = 2'd3;	// M 0
    		end

    	    12:
    		begin
    		p[7] = 2'd3;	// M 7
    		p[6] = 2'd3;	// M 6
    		p[5] = 2'd3;	// M 5
    		p[4] = 2'd0;	// M 4
    		p[3] = 2'd0;	// M 3
    		p[2] = 2'd0;	// M 2
    		p[1] = 2'd1;	// M 1
    		p[0] = 2'd1;	// M 0
    		end

    	    16:
    		begin
    		p[7] = 2'd0;	// M 7
    		p[6] = 2'd0;	// M 6
    		p[5] = 2'd0;	// M 5
    		p[4] = 2'd0;	// M 4
    		p[3] = 2'd1;	// M 3
    		p[2] = 2'd1;	// M 2
    		p[1] = 2'd3;	// M 1
    		p[0] = 2'd3;	// M 0
    		end

    	    20:
    		begin
    		p[7] = 2'd3;	// M 7
    		p[6] = 2'd0;	// M 6
    		p[5] = 2'd2;	// M 5
    		p[4] = 2'd0;	// M 4
    		p[3] = 2'd1;	// M 3
    		p[2] = 2'd0;	// M 2
    		p[1] = 2'd0;	// M 1
    		p[0] = 2'd0;	// M 0
    		end

    	    24:
    		begin
    		p[7] = 2'd0;	// M 7
    		p[6] = 2'd0;	// M 6
    		p[5] = 2'd1;	// M 5
    		p[4] = 2'd0;	// M 4
    		p[3] = 2'd0;	// M 3
    		p[2] = 2'd2;	// M 2
    		p[1] = 2'd0;	// M 1
    		p[0] = 2'd3;	// M 0
    		end

    	    28:
    		begin
    		p[7] = 2'd0;	// M 7
    		p[6] = 2'd0;	// M 6
    		p[5] = 2'd1;	// M 5
    		p[4] = 2'd0;	// M 4
    		p[3] = 2'd0;	// M 3
    		p[2] = 2'd0;	// M 2
    		p[1] = 2'd0;	// M 1
    		p[0] = 2'd3;	// M 0
    		end

    	    default:
    		begin
    		p[7] = p[7] + 1;// M 7
    		p[6] = p[6] + 1;// M 6
    		p[5] = p[5] + 1;// M 5
    		p[4] = p[4] + 1;// M 4
    		p[3] = p[3] + 1;// M 3
    		p[2] = p[2] + 1;// M 2
    		p[1] = p[1] + 1;// M 1
    		p[0] = p[0] + 1;// M 0
    		end
    	endcase

    	m1.wb_wr1( 32'hff00_0000, 4'hf, {16'h0000, p[7], p[6], p[5],
    			p[4], p[3], p[2], p[1], p[0]} );

    	@(posedge clk);
    	fork
    	   begin
    		repeat(del)	@(posedge clk);
    		m0.wb_wr_mult( 32'h0000_0000             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m0.wb_rd_mult( 32'h0000_0000 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m0.wb_wr_mult( 32'h0000_0000 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m0.wb_rd_mult( 32'h0000_0000 + (siz * 12), 4'hf, del, siz);
    		t[0] = $time;
    	   end

    	   begin
    		repeat(del)	@(posedge clk);
    		m1.wb_rd_mult( 32'h0000_0100             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m1.wb_wr_mult( 32'h0000_0100 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m1.wb_rd_mult( 32'h0000_0100 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m1.wb_wr_mult( 32'h0000_0100 + (siz * 12), 4'hf, del, siz);
    		t[1] = $time;
    	   end

    	   begin
    		repeat(del)	@(posedge clk);
    		m2.wb_wr_mult( 32'h0000_0200             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m2.wb_rd_mult( 32'h0000_0200 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m2.wb_wr_mult( 32'h0000_0200 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m2.wb_rd_mult( 32'h0000_0200 + (siz * 12), 4'hf, del, siz);
    		t[2] = $time;
    	   end

    	   begin
    		repeat(del)	@(posedge clk);
    		m3.wb_rd_mult( 32'h0000_0300             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m3.wb_wr_mult( 32'h0000_0300 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m3.wb_rd_mult( 32'h0000_0300 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m3.wb_wr_mult( 32'h0000_0300 + (siz * 12), 4'hf, del, siz);
    		t[3] = $time;
    	   end

    	   begin
    		repeat(del)	@(posedge clk);
    		m4.wb_wr_mult( 32'h0000_0400             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m4.wb_rd_mult( 32'h0000_0400 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m4.wb_wr_mult( 32'h0000_0400 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m4.wb_rd_mult( 32'h0000_0400 + (siz * 12), 4'hf, del, siz);
    		t[4] = $time;
    	   end

    	   begin
    		repeat(del)	@(posedge clk);
    		m5.wb_rd_mult( 32'h0000_0500             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m5.wb_wr_mult( 32'h0000_0500 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m5.wb_rd_mult( 32'h0000_0500 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m5.wb_wr_mult( 32'h0000_0500 + (siz * 12), 4'hf, del, siz);
    		t[5] = $time;
    	   end

    	   begin
    		repeat(del)	@(posedge clk);
    		m6.wb_wr_mult( 32'h0000_0600             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m6.wb_rd_mult( 32'h0000_0600 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m6.wb_wr_mult( 32'h0000_0600 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m6.wb_rd_mult( 32'h0000_0600 + (siz * 12), 4'hf, del, siz);
    		t[6] = $time;
    	   end

    	   begin
    		repeat(del)	@(posedge clk);
    		m7.wb_wr_mult( 32'h0000_0700             , 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m7.wb_rd_mult( 32'h0000_0700 + (siz *  4), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m7.wb_wr_mult( 32'h0000_0700 + (siz *  8), 4'hf, del, siz);
    		repeat(del)	@(posedge clk);
    		m7.wb_rd_mult( 32'h0000_0700 + (siz * 12), 4'hf, del, siz);
    		t[7] = $time;
    	   end

    	join

    	verify(0,0,siz*4);
    	verify(1,0,siz*4);
    	verify(2,0,siz*4);
    	verify(3,0,siz*4);
    	verify(4,0,siz*4);
    	verify(5,0,siz*4);
    	verify(6,0,siz*4);
    	verify(7,0,siz*4);

    	for(a=0;a<8;a=a+1)
    	for(b=0;b<8;b=b+1)
    		if((t[a] < t[b]) & (p[a] <= p[b]) & (p[a] != p[b]) )
    		   begin
    			$display("ERROR: Master %0d compleated before Master %0d", a, b);
    			$display("       M[%0d] pri: %0d (t: %0t)", a, p[a], t[a]);
    			$display("       M[%0d] pri: %0d (t: %0t)", b, p[b], t[b]);
    			error_cnt = error_cnt + 1;
    		   end
       end

    	show_errors;
    	$display("*****************************************************");
    	$display("*** Test DONE ...                                 ***");
    	$display("*****************************************************\n\n");

    end
    endtask



    task test_dp1;

    integer	n;
    reg	[3:0]	s0, s1, s2, s3, s4, s5, s6, s7;

    begin

    	$display("\n\n");
    	$display("*****************************************************");
    	$display("*** Datapath 1 Test ...                           ***");
    	$display("*****************************************************\n");

    s0 = 0;
    s1 = 1;
    s2 = 2;
    s3 = 3;
    s4 = 4;
    s5 = 5;
    s6 = 6;
    s7 = 7;

    for(n=0;n<16;n=n+1)
       begin
    	init_all_mem;
    	$display("Mode: %0d", n);

    	fork

    	begin
    		m0.wb_wr_mult( 32'h0000_0000 + (s0 << 28), 4'hf, 0, 4);
    		m0.wb_rd_mult( 32'h0000_0010 + (s0 << 28), 4'hf, 0, 4);
    		m0.wb_wr_mult( 32'h0000_0020 + (s0 << 28), 4'hf, 0, 4);
    		m0.wb_rd_mult( 32'h0000_0030 + (s0 << 28), 4'hf, 0, 4);
    	end

    	begin
    		m1.wb_wr_mult( 32'h0000_0100 + (s1 << 28), 4'hf, 0, 4);
    		m1.wb_rd_mult( 32'h0000_0110 + (s1 << 28), 4'hf, 0, 4);
    		m1.wb_wr_mult( 32'h0000_0120 + (s1 << 28), 4'hf, 0, 4);
    		m1.wb_rd_mult( 32'h0000_0130 + (s1 << 28), 4'hf, 0, 4);
    	end

    	begin
    		m2.wb_wr_mult( 32'h0000_0200 + (s2 << 28), 4'hf, 0, 4);
    		m2.wb_rd_mult( 32'h0000_0210 + (s2 << 28), 4'hf, 0, 4);
    		m2.wb_wr_mult( 32'h0000_0220 + (s2 << 28), 4'hf, 0, 4);
    		m2.wb_rd_mult( 32'h0000_0230 + (s2 << 28), 4'hf, 0, 4);
    	end

    	begin
    		m3.wb_wr_mult( 32'h0000_0300 + (s3 << 28), 4'hf, 0, 4);
    		m3.wb_rd_mult( 32'h0000_0310 + (s3 << 28), 4'hf, 0, 4);
    		m3.wb_wr_mult( 32'h0000_0320 + (s3 << 28), 4'hf, 0, 4);
    		m3.wb_rd_mult( 32'h0000_0330 + (s3 << 28), 4'hf, 0, 4);
    	end

    	begin
    		m4.wb_wr_mult( 32'h0000_0400 + (s4 << 28), 4'hf, 0, 4);
    		m4.wb_rd_mult( 32'h0000_0410 + (s4 << 28), 4'hf, 0, 4);
    		m4.wb_wr_mult( 32'h0000_0420 + (s4 << 28), 4'hf, 0, 4);
    		m4.wb_rd_mult( 32'h0000_0430 + (s4 << 28), 4'hf, 0, 4);
    	end

    	begin
    		m5.wb_wr_mult( 32'h0000_0500 + (s5 << 28), 4'hf, 0, 4);
    		m5.wb_rd_mult( 32'h0000_0510 + (s5 << 28), 4'hf, 0, 4);
    		m5.wb_wr_mult( 32'h0000_0520 + (s5 << 28), 4'hf, 0, 4);
    		m5.wb_rd_mult( 32'h0000_0530 + (s5 << 28), 4'hf, 0, 4);
    	end

    	begin
    		m6.wb_wr_mult( 32'h0000_0600 + (s6 << 28), 4'hf, 0, 4);
    		m6.wb_rd_mult( 32'h0000_0610 + (s6 << 28), 4'hf, 0, 4);
    		m6.wb_wr_mult( 32'h0000_0620 + (s6 << 28), 4'hf, 0, 4);
    		m6.wb_rd_mult( 32'h0000_0630 + (s6 << 28), 4'hf, 0, 4);
    	end

    	begin
    		m7.wb_wr_mult( 32'h0000_0700 + (s7 << 28), 4'hf, 0, 4);
    		m7.wb_rd_mult( 32'h0000_0710 + (s7 << 28), 4'hf, 0, 4);
    		m7.wb_wr_mult( 32'h0000_0720 + (s7 << 28), 4'hf, 0, 4);
    		m7.wb_rd_mult( 32'h0000_0730 + (s7 << 28), 4'hf, 0, 4);
    	end

    	join

    	verify(0,s0,16);
    	verify(1,s1,16);
    	verify(2,s2,16);
    	verify(3,s3,16);
    	verify(4,s4,16);
    	verify(5,s5,16);
    	verify(6,s6,16);
    	verify(7,s7,16);

    	@(posedge clk);

    	s0 = s0 + 1;
    	s1 = s1 + 1;
    	s2 = s2 + 1;
    	s3 = s3 + 1;
    	s4 = s4 + 1;
    	s5 = s5 + 1;
    	s6 = s6 + 1;
    	s7 = s7 + 1;

    	@(posedge clk);

       end

    	show_errors;
    	$display("*****************************************************");
    	$display("*** Test DONE ...                                 ***");
    	$display("*****************************************************\n\n");

    end
    endtask

    task test_dp2;

    integer	del;
    integer	x0, x1, x2, x3, x4, x5, x6, x7;
    reg	[3:0]	m;

    begin

    	$display("\n\n");
    	$display("*****************************************************");
    	$display("*** Datapath 2 Test ...                           ***");
    	$display("*****************************************************\n");

    del=0;
    for(del=0;del<5;del=del+1)
       begin
    	init_all_mem;
    	$display("Delay: %0d", del);

    	fork

    	begin
    		for(x0=0;x0<16;x0=x0+1)
    			m0.wb_rd_mult( 32'h0000_0000 + ((0+x0) << 28) + (x0<<4), 4'hf, del, 4);
    	end

    	begin
    		for(x1=0;x1<16;x1=x1+1)
    			m1.wb_rd_mult( 32'h0000_0100 + ((1+x1) << 28) + (x1<<4), 4'hf, del, 4);
    	end

    	begin
    		for(x2=0;x2<16;x2=x2+1)
    			m2.wb_rd_mult( 32'h0000_0200 + ((2+x2) << 28) + (x2<<4), 4'hf, del, 4);

    	end

    	begin
    		for(x3=0;x3<16;x3=x3+1)
    			m3.wb_rd_mult( 32'h0000_0300 + ((3+x3) << 28) + (x3<<4), 4'hf, del, 4);
    	end

    	begin
    		for(x4=0;x4<16;x4=x4+1)
    			m4.wb_rd_mult( 32'h0000_0400 + ((4+x4) << 28) + (x4<<4), 4'hf, del, 4);
    	end

    	begin
    		for(x5=0;x5<16;x5=x5+1)
    			m5.wb_rd_mult( 32'h0000_0500 + ((5+x5) << 28) + (x5<<4), 4'hf, del, 4);
    	end

    	begin
    		for(x6=0;x6<16;x6=x6+1)
    			m6.wb_rd_mult( 32'h0000_0600 + ((6+x6) << 28) + (x6<<4), 4'hf, del, 4);
    	end

    	begin
    		for(x7=0;x7<16;x7=x7+1)
    			m7.wb_rd_mult( 32'h0000_0700 + ((7+x7) << 28) + (x7<<4), 4'hf, del, 4);
    	end
    	join

    	for(x1=0;x1<8;x1=x1+1)
    	for(x0=0;x0<16;x0=x0+1)
    	   begin
    		m = x0+x1;
    		verify_sub(x1,m,4,(x0*4),(x0*4));
    	   end

       end

    	show_errors;
    	$display("*****************************************************");
    	$display("*** Test DONE ...                                 ***");
    	$display("*****************************************************\n\n");

    end
    endtask


    task test_rf;

    integer	n, m;
    reg	[31:0]	wdata[0:15];
    reg	[31:0]	rdata[0:15];
    reg	[15:0]	rtmp, wtmp;

    begin

    	$display("\n\n");
    	$display("*****************************************************");
    	$display("*** Register File Test ...                        ***");
    	$display("*****************************************************\n");

    for(m=0;m<5;m=m+1)
       begin
    	$display("Mode: %0d", m);

    	for(n=0;n<16;n=n+1)
    		wdata[n] = $random;

    	for(n=0;n<16;n=n+1)
    		case(m)
    		   0: m0.wb_wr1(32'hff00_0000 + (n << 2), 4'hf, wdata[n]);
    		   1: m3.wb_wr1(32'hff00_0000 + (n << 2), 4'hf, wdata[n]);
    		   2: m5.wb_wr1(32'hff00_0000 + (n << 2), 4'hf, wdata[n]);
    		   3: m7.wb_wr1(32'hff00_0000 + (n << 2), 4'hf, wdata[n]);
    		   4: m7.wb_wr1(32'hff00_0000 + (n << 2), 4'hf, wdata[n]);
    		endcase

    	for(n=0;n<16;n=n+1)
    		case(m)
    		   0: m7.wb_rd1(32'hff00_0000 + (n << 2), 4'hf, rdata[n]);
    		   1: m3.wb_rd1(32'hff00_0000 + (n << 2), 4'hf, rdata[n]);
    		   2: m6.wb_rd1(32'hff00_0000 + (n << 2), 4'hf, rdata[n]);
    		   3: m0.wb_rd1(32'hff00_0000 + (n << 2), 4'hf, rdata[n]);
    		   4: m7.wb_rd1(32'hff00_0000 + (n << 2), 4'hf, rdata[n]);
    		endcase

    	for(n=0;n<16;n=n+1)
    	   begin
    		rtmp = rdata[n];
    		wtmp = wdata[n];
    		if(rtmp !== wtmp)
    		   begin
    			$display("ERROR: RF[%0d] Mismatch. Expected: %h, Got: %h (%0t)",
    			n, wtmp, rtmp, $time);
    		   end
    	   end
       end

    	show_errors;
    	$display("*****************************************************");
    	$display("*** Test DONE ...                                 ***");
    	$display("*****************************************************\n\n");


    end
    endtask


endmodule
