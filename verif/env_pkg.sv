    `include "master_pkg.sv"
    `include "slave_pkg.sv"
    `include "base_if.sv"

package env_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"


    import master_pkg::*;
    import slave_pkg::*;
    // Includes
    `include "base_test.sv"
    `include "base_env.sv"
    `include "base_transaction.sv"
    `include "base_sequence.sv"

    `include "base_env.sv"

    `include "base_test.sv"
endpackage : env_pkg
