//`include "master/master_pkg.sv"
//`include "slave/slave_pkg.sv"
//  `include "base_if.sv"

package seq_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  typedef enum {READ, WRITE} operation_t;
  typedef enum {MASTER_MODE, SLAVE_MODE} mode_t;

  `include "base_transaction.sv"
  `include "base_sequence.sv"
endpackage : seq_pkg
