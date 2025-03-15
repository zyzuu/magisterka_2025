//`include "master/master_pkg.sv"
//`include "slave/slave_pkg.sv"
//  `include "base_if.sv"

package env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"


  //`include "base_transaction.sv"
  import seq_pkg::*;
  // Includes
  //`include "base_sequence.sv"
  import slave_pkg::*;
  import master_pkg::*;
  `include "base_env.sv"
  `include "base_test.sv"
//
  //`include "base_env.sv"
//
  //`include "base_test.sv"
endpackage : env_pkg
