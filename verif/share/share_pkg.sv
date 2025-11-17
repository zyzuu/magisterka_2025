package share_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Parameters
  parameter int DW = 32; // Data width
  parameter int AW = 32; // Address width
  parameter int SW = 4;  // Select width

endpackage : share_pkg