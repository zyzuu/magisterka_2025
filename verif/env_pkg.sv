//`include "master/master_pkg.sv"
//`include "slave/slave_pkg.sv"
//  `include "base_if.sv"

package env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import slave_pkg::*;
  import master_pkg::*;
  import seq_pkg::*;

  `include "base_env.sv"
  `include "base_vseq.sv"
  `include "base_test.sv"

endpackage : env_pkg
