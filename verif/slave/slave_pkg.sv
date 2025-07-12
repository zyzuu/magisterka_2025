package slave_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import seq_pkg::*;
  // Includes
  //`include "base_transaction.sv"

  `include "slave_sequencer.sv"
  `include "slave_driver.sv"
  `include "slave_monitor.sv"
  `include "slave_agent.sv"

endpackage : slave_pkg
