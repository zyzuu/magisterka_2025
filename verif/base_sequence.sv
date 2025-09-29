//  Class: base_sequence
//
class base_sequence extends uvm_sequence #(base_transaction);
  `uvm_object_utils(base_sequence)

  rand base_transaction m_req, m_rsp;
  rand int number_of_transactions = 1;
  rand bit [AW-1:0] destination_address;
  rand bit [SW-1:0] sel;
  rand bit [DW-1:0] r_data_out;
  rand bit transaction_type;
  rand cycle_type_t cycle_type;
  rand bit s_we;

  constraint c_data_out {
    if (s_we == 0) r_data_out == 0;
  }


  function new(string name = "base_sequence");
    super.new(name);
  endfunction: new

  virtual task body();
    uvm_objection objection = new("objection");
    m_req = base_transaction::type_id::create("m_req");
    m_req.randomize() with {
      mode == MASTER_MODE;
      num_of_transactions == number_of_transactions;
      addr == destination_address;
      cycle_type == SINGLE;
      data_out == r_data_out;
      we == s_we;
    };
    objection.raise_objection(this);
    start_item(m_req);
    `uvm_info(get_type_name(), "After start_item call!", UVM_DEBUG);
    finish_item(m_req);
    `uvm_info(get_type_name(), "After finish_item call!", UVM_DEBUG);
    objection.drop_objection(this);
  endtask: body

endclass: base_sequence
