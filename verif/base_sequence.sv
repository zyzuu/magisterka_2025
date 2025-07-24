//  Class: base_sequence
//
class base_sequence extends uvm_sequence #(base_transaction);
  `uvm_object_utils(base_sequence)

  int number_of_transactions = 10000;
  base_transaction m_base_transaction;

  function new(string name = "base_sequence");
    super.new(name);
  endfunction: new

  virtual task body();
    m_base_transaction = base_transaction::type_id::create("m_base_transaction");
    for (int i=0; i<number_of_transactions; ++i) begin
      m_base_transaction.randomize() with {
        mode == MASTER_MODE;
      };
      start_item(m_base_transaction);
      `uvm_info(get_type_name(), "After start_item call!", UVM_DEBUG);
      finish_item(m_base_transaction);
      `uvm_info(get_type_name(), "After finish_item call!", UVM_DEBUG);
    end
  endtask: body

endclass: base_sequence
