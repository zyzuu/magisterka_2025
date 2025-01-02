//  Class: base_transaction
//
class base_transaction extends uvm_sequence_item;
    `uvm_object_utils(base_transaction);
    
    // Parameters
    parameter int DW = 32; // Data width
    parameter int AW = 32; // Address width
    parameter int SW = DW/8;  // Select width

    // Mode of operation
    typedef enum {MASTER_MODE, SLAVE_MODE} mode_t;
    rand mode_t mode;

    typedef enum {READ, WRITE} operation_t;
    rand operation_t operation;

    // Unified fields for both Master and Slave interfaces
    rand bit [DW-1:0] data_in;  // Input data (Master: m0_data_i, Slave: s0_data_i)
    bit [DW-1:0]      data_out;  // Output data (Master: m0_data_o, Slave: s0_data_o)
    rand bit [AW-1:0] addr;    // Address (Master: m0_addr_i, Slave: s0_addr_o)
    rand bit [SW-1:0] sel;     // Select lines (Master: m0_sel_i, Slave: s0_sel_o)
    rand bit          we;      // Write enable (Master: m0_we_i, Slave: s0_we_o)
    rand bit          cyc;     // Cycle valid (Master: m0_cyc_i, Slave: s0_cyc_o)
    rand bit          stb;     // Strobe (Master: m0_stb_i, Slave: s0_stb_o)
    bit               ack;     // Acknowledge (Master: m0_ack_o, Slave: s0_ack_i)
    bit               err;     // Error (Master: m0_err_o, Slave: s0_err_i)
    bit               rty;     // Retry (Master: m0_rty_o, Slave: s0_rty_i)


    //  Factory registration for fields
  `uvm_object_utils_begin(base_transaction)
    `uvm_field_enum(operation_t, operation, UVM_ALL_ON)
    `uvm_field_int(data_in, UVM_ALL_ON)
    `uvm_field_int(data_out, UVM_ALL_ON)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(sel, UVM_ALL_ON)
    `uvm_field_bit(we, UVM_ALL_ON)
    `uvm_field_bit(cyc, UVM_ALL_ON)
    `uvm_field_bit(stb, UVM_ALL_ON)
    `uvm_field_bit(ack, UVM_ALL_ON)
    `uvm_field_bit(err, UVM_ALL_ON)
    `uvm_field_bit(rty, UVM_ALL_ON)
  `uvm_object_utils_end

    // TODO: ADD PROPER CONSTRAINTS
    
    function new(string name = "base_transaction");
        super.new(name);
    endfunction: new
endclass: base_transaction

