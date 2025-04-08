class base_vseq extends uvm_sequence #(base_transaction);
  `uvm_object_utils(base_vseq)

  uvm_sequencer #(base_transaction) m_sequencer_00;
  uvm_sequencer #(base_transaction) m_sequencer_01;
  uvm_sequencer #(base_transaction) m_sequencer_02;
  uvm_sequencer #(base_transaction) m_sequencer_03;
  uvm_sequencer #(base_transaction) m_sequencer_04;
  uvm_sequencer #(base_transaction) m_sequencer_05;
  uvm_sequencer #(base_transaction) m_sequencer_06;
  uvm_sequencer #(base_transaction) m_sequencer_07;

  uvm_sequencer #(base_transaction) s_sequencer_00;
  uvm_sequencer #(base_transaction) s_sequencer_01;
  uvm_sequencer #(base_transaction) s_sequencer_02;
  uvm_sequencer #(base_transaction) s_sequencer_03;
  uvm_sequencer #(base_transaction) s_sequencer_04;
  uvm_sequencer #(base_transaction) s_sequencer_05;
  uvm_sequencer #(base_transaction) s_sequencer_06;
  uvm_sequencer #(base_transaction) s_sequencer_07;
  uvm_sequencer #(base_transaction) s_sequencer_08;
  uvm_sequencer #(base_transaction) s_sequencer_09;
  uvm_sequencer #(base_transaction) s_sequencer_10;
  uvm_sequencer #(base_transaction) s_sequencer_11;
  uvm_sequencer #(base_transaction) s_sequencer_12;
  uvm_sequencer #(base_transaction) s_sequencer_13;
  uvm_sequencer #(base_transaction) s_sequencer_14;
  uvm_sequencer #(base_transaction) s_sequencer_15;

  int number_of_transactions = 1;

  function new(string name = "base_vseq");
    super.new(name);
  endfunction: new

  virtual task body();
      base_sequence m_base_seq = base_sequence::type_id::create("m_base_seq");
      m_base_seq.start(m_sequencer_00);
      m_base_seq.start(m_sequencer_01);
      m_base_seq.start(m_sequencer_02);
      m_base_seq.start(m_sequencer_03);
      m_base_seq.start(m_sequencer_04);
      m_base_seq.start(m_sequencer_05);
      m_base_seq.start(m_sequencer_06);
      m_base_seq.start(m_sequencer_07);
  endtask: body

endclass: base_vseq