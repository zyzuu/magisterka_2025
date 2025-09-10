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
  master_sequencer m_sequencer_ral;

  //config_regmodel m_ral_model;
  config_block regmodel;

  function new(string name = "base_vseq");
    super.new(name);
  endfunction: new

  virtual task body();
    uvm_status_e status;
    int rdata;
    base_sequence prio_seq = base_sequence::type_id::create("prio_seq");
    base_sequence prio_seq_2 = base_sequence::type_id::create("prio_seq_2");
    base_sequence m_base_seq_0 = base_sequence::type_id::create("m_base_seq_0");
    base_sequence m_base_seq_1 = base_sequence::type_id::create("m_base_seq_1");
    base_sequence m_base_seq_2 = base_sequence::type_id::create("m_base_seq_2");
    base_sequence m_base_seq_3 = base_sequence::type_id::create("m_base_seq_3");
    base_sequence m_base_seq_4 = base_sequence::type_id::create("m_base_seq_4");
    base_sequence m_base_seq_5 = base_sequence::type_id::create("m_base_seq_5");
    base_sequence m_base_seq_6 = base_sequence::type_id::create("m_base_seq_6");
    base_sequence m_base_seq_7 = base_sequence::type_id::create("m_base_seq_7");

    block_sequence m_block_seq = block_sequence::type_id::create("m_block_seq");
    rmw_sequence m_rmw_seq = rmw_sequence::type_id::create("m_rmw_seq");
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
    if(!uvm_config_db #(master_sequencer)::get(null, "Sequencers", "agent_ral_sqr", m_sequencer_ral)) begin
      `uvm_error(get_type_name(), "agent_ral_sqr of type a_sequencer not found in the uvm_config_db")
    end


    //$displayh("regmodel: %p", regmodel);
    regmodel.config_reg_s0.write(status, 'h3);
    //$displayh("status: %p", status);
    //regmodel.config_reg_s0.read(status, rdata);
    //$displayh("status: %p, rdata: %p", status, rdata);
    //regmodel.config_reg_s1.write(status, 'h4);
    //regmodel.config_reg_s4.write(status, 'h7);
    //regmodel.config_reg_s10.write(status, 'h9);
    //regmodel.config_reg_s15.write(status, 'hF);


    prio_seq.randomize with {
      s_we == 1;
      destination_address == 32'hF000_0004;
      r_data_out == {16'b0, 2'b11, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00};
    };

    prio_seq_2.randomize with {
      s_we == 0;
      destination_address == 32'hFF00_0004;
      //r_data_out == {16'b0, 2'b11, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00};
      r_data_out == 0;
    };


    m_base_seq_0.randomize with {destination_address == 32'h0000_0000;};
    m_base_seq_1.randomize with {destination_address == 32'h0000_0001;};
    m_base_seq_2.randomize with {destination_address == 32'h0000_0002;};
    m_base_seq_3.randomize with {destination_address == 32'h0000_0003;};
    m_base_seq_4.randomize with {destination_address == 32'h0000_0004;};
    m_base_seq_5.randomize with {destination_address == 32'h0000_0005;};
    m_base_seq_6.randomize with {destination_address == 32'h0000_0006;};
    m_base_seq_7.randomize with {destination_address == 32'h0000_0007;};

    //prio_seq.start(m_sequencer_00);
    //prio_seq_2.start(m_sequencer_00);

    //fork
    //  m_base_seq_0.start(m_sequencer_00);
    //  m_base_seq_1.start(m_sequencer_01);
    //  m_base_seq_2.start(m_sequencer_02);
    //  m_base_seq_3.start(m_sequencer_03);
    //  m_base_seq_4.start(m_sequencer_04);
    //  m_base_seq_5.start(m_sequencer_05);
    //  m_base_seq_6.start(m_sequencer_06);
    //  m_base_seq_7.start(m_sequencer_07);
    //join



  endtask: body

endclass: base_vseq