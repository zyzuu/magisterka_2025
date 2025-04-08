//`include "master/master_pkg.sv"
//`include "slave/slave_pkg.sv"
//  `include "base_if.sv"

package seq_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "base_transaction.sv"
  `include "base_sequence.sv"
  `include "base_vseq.sv"
endpackage : seq_pkg
