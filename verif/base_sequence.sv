//  Class: base_sequence
//
class base_sequence extends uvm_sequence;
  `uvm_object_utils(base_sequence);

  rand int number_of_transactions;

  function new(string name = "base_sequence");
    super.new(name);
  endfunction: new

  virtual task body();
    for (int i=0; i<number_of_transactions; ++i) begin
      base_transaction m_base_transaction = base_transaction::type_id::create("m_base_transaction");

      // Create and randomize the sequence item for master
      start_item(m_base_transaction);
      m_base_transaction.randomize() with {mode == base_transaction::MASTER_MODE;};
      $display("m_base_transaction_item: %p", m_base_transaction);
      finish_item(m_base_transaction);

      // Create and randomize the sequence item for slave
      start_item(m_base_transaction);
      m_base_transaction.randomize() with {mode == base_transaction::SLAVE_MODE;};
      $display("m_base_transaction_item: %p", m_base_transaction);
      finish_item(m_base_transaction);
    end
  endtask: body

endclass: base_sequence
