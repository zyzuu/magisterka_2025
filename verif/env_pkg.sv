package env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import slave_pkg::*;
  import master_pkg::*;
  import seq_pkg::*;
  import share_pkg::*;

  `include "base_scoreboard.sv"
  `include "base_env.sv"
  `include "base_vseq.sv"
  `include "base_test.sv"

endpackage : env_pkg
