package master_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import seq_pkg::*;
  import ral_pkg::*;

  `include "master_sequencer.sv"
  `include "master_monitor.sv"
  `include "master_driver.sv"
  `include "master_agent.sv"

endpackage : master_pkg
