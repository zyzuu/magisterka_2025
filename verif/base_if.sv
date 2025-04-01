interface base_if #(int DATA_WIDTH = 32, int ADDR_WIDTH = 32, int SEL_WIDTH = 4) (input clk_i, input rst_i);
  logic [DATA_WIDTH-1:0] data_in; // Data Input
  logic [DATA_WIDTH-1:0] data_out; // Data Output
  logic [ADDR_WIDTH-1:0] addr; // Address Bus
  logic [SEL_WIDTH-1:0] sel; // Byte Select Signals
  logic we; // Write Enable
  logic cyc; // Cycle Signal
  logic stb; // Strobe Signal
  logic ack; // Acknowledge Signal
  logic err; // Error Signal
  logic rty; // Retry Signal

  modport master_if (
    input data_in,
    input addr,
    input sel,
    input we,
    input cyc,
    input stb,
    output data_out,
    output ack,
    output err,
    output rty
  );
  modport slave_if (
    input data_in,
    input ack,
    input err,
    input rty,
    output data_out,
    output addr,
    output sel,
    output we,
    output cyc,
    output stb
  );
endinterface : base_if
