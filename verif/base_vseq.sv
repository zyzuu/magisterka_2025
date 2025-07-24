class base_vseq extends uvm_sequence #(base_transaction);
  `uvm_object_utils(base_vseq)

  master_sequencer m_sequencer_00;
  master_sequencer m_sequencer_01;
  master_sequencer m_sequencer_02;
  master_sequencer m_sequencer_03;
  master_sequencer m_sequencer_04;
  master_sequencer m_sequencer_05;
  master_sequencer m_sequencer_06;
  master_sequencer m_sequencer_07;

  function new(string name = "base_vseq");
    super.new(name);
  endfunction: new

  virtual task body();
    base_sequence m_base_seq = base_sequence::type_id::create("m_base_seq");
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_00_sqr", m_sequencer_00)) begin
      `uvm_error(get_type_name(), "agent_00_sqr of type a_sequencer not found in the uvm_config_db")
    end
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_01_sqr", m_sequencer_01)) begin
      `uvm_error(get_type_name(), "agent_01_sqr of type a_sequencer not found in the uvm_config_db")
    end
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_02_sqr", m_sequencer_02)) begin
      `uvm_error(get_type_name(), "agent_02_sqr of type a_sequencer not found in the uvm_config_db")
    end
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_03_sqr", m_sequencer_03)) begin
      `uvm_error(get_type_name(), "agent_03_sqr of type a_sequencer not found in the uvm_config_db")
    end
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_04_sqr", m_sequencer_04)) begin
      `uvm_error(get_type_name(), "agent_04_sqr of type a_sequencer not found in the uvm_config_db")
    end
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_05_sqr", m_sequencer_05)) begin
      `uvm_error(get_type_name(), "agent_05_sqr of type a_sequencer not found in the uvm_config_db")
    end
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_06_sqr", m_sequencer_06)) begin
      `uvm_error(get_type_name(), "agent_06_sqr of type a_sequencer not found in the uvm_config_db")
    end
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_07_sqr", m_sequencer_07)) begin
      `uvm_error(get_type_name(), "agent_07_sqr of type a_sequencer not found in the uvm_config_db")
    end
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