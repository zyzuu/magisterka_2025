//  Class: base_transaction
//
class base_transaction extends uvm_sequence_item;
  // Mode of operation
  rand mode_t mode;
  rand operation_t operation;
  rand cycle_type_t cycle_type = SINGLE;

  bit [DW-1:0] data_in;
  rand bit [DW-1:0] data_out;
  rand bit [AW-1:0] addr;
  rand bit [SW-1:0] sel; // Not used by our agents, always DW of data is send and recevied
  rand bit      we;
  rand bit      cyc;
  rand bit      stb;
  bit         ack;
  bit         err;
  bit         rty;
  rand int num_of_transactions;

  `uvm_object_utils_begin(base_transaction)
    `uvm_field_enum(operation_t, operation, UVM_ALL_ON)
    `uvm_field_enum(cycle_type_t, cycle_type, UVM_ALL_ON)
    `uvm_field_int(data_out, UVM_ALL_ON)
    `uvm_field_int(data_in, UVM_ALL_ON)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(sel, UVM_ALL_ON)
    `uvm_field_int(we, UVM_ALL_ON)
    `uvm_field_int(cyc, UVM_ALL_ON)
    `uvm_field_int(stb, UVM_ALL_ON)
    `uvm_field_int(ack, UVM_ALL_ON)
    `uvm_field_int(err, UVM_ALL_ON)
    `uvm_field_int(rty, UVM_ALL_ON)
    `uvm_field_int(num_of_transactions, UVM_ALL_ON)
  `uvm_object_utils_end

  constraint c__we {
    solve we before data_out;
    if (we == 0) data_out == 0;
    cyc == 1;
    stb == 1;
  }
  constraint c__addr {
    addr[31:28] >= 0;
    addr[31:28] <= 4'hF;
    addr[31:28] == 4'hF -> addr[27:24] != 4'hF;
    sel == 'd1;
  }
  constraint c__cycle_type_addr {
    cycle_type == BLOCK -> addr[31:24] != 'hFF;
  }

  function new(string name = "base_transaction");
    super.new(name);
  endfunction: new
endclass: base_transaction
