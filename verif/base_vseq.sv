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

  config_block regmodel;

  function new(string name = "base_vseq");
    super.new(name);
  endfunction: new

  virtual task body();
    uvm_status_e status;
    int rdata [16];

    base_sequence m_base_seq_0 = base_sequence::type_id::create("m_base_seq_0");
    base_sequence m_base_seq_1 = base_sequence::type_id::create("m_base_seq_1");
    base_sequence m_base_seq_2 = base_sequence::type_id::create("m_base_seq_2");
    base_sequence m_base_seq_3 = base_sequence::type_id::create("m_base_seq_3");
    base_sequence m_base_seq_4 = base_sequence::type_id::create("m_base_seq_4");
    base_sequence m_base_seq_5 = base_sequence::type_id::create("m_base_seq_5");
    base_sequence m_base_seq_6 = base_sequence::type_id::create("m_base_seq_6");
    base_sequence m_base_seq_7 = base_sequence::type_id::create("m_base_seq_7");

    block_sequence m_block_seq_0 = block_sequence::type_id::create("m_block_seq_0");
    block_sequence m_block_seq_1 = block_sequence::type_id::create("m_block_seq_1");
    block_sequence m_block_seq_2 = block_sequence::type_id::create("m_block_seq_2");
    block_sequence m_block_seq_3 = block_sequence::type_id::create("m_block_seq_3");
    block_sequence m_block_seq_4 = block_sequence::type_id::create("m_block_seq_4");
    block_sequence m_block_seq_5 = block_sequence::type_id::create("m_block_seq_5");
    block_sequence m_block_seq_6 = block_sequence::type_id::create("m_block_seq_6");
    block_sequence m_block_seq_7 = block_sequence::type_id::create("m_block_seq_7");
    block_sequence m_block_seq_8 = block_sequence::type_id::create("m_block_seq_8");
    block_sequence m_block_seq_9 = block_sequence::type_id::create("m_block_seq_9");
    block_sequence m_block_seq_10 = block_sequence::type_id::create("m_block_seq_10");
    block_sequence m_block_seq_11 = block_sequence::type_id::create("m_block_seq_11");
    block_sequence m_block_seq_12 = block_sequence::type_id::create("m_block_seq_12");
    block_sequence m_block_seq_13 = block_sequence::type_id::create("m_block_seq_13");
    block_sequence m_block_seq_14 = block_sequence::type_id::create("m_block_seq_14");
    block_sequence m_block_seq_15 = block_sequence::type_id::create("m_block_seq_15");

    rmw_sequence m_rmw_seq_0 = rmw_sequence::type_id::create("m_rmw_seq_0");
    rmw_sequence m_rmw_seq_1 = rmw_sequence::type_id::create("m_rmw_seq_1");
    rmw_sequence m_rmw_seq_2 = rmw_sequence::type_id::create("m_rmw_seq_2");
    rmw_sequence m_rmw_seq_3 = rmw_sequence::type_id::create("m_rmw_seq_3");
    rmw_sequence m_rmw_seq_4 = rmw_sequence::type_id::create("m_rmw_seq_4");
    rmw_sequence m_rmw_seq_5 = rmw_sequence::type_id::create("m_rmw_seq_5");
    rmw_sequence m_rmw_seq_6 = rmw_sequence::type_id::create("m_rmw_seq_6");
    rmw_sequence m_rmw_seq_7 = rmw_sequence::type_id::create("m_rmw_seq_7");
    rmw_sequence m_rmw_seq_8 = rmw_sequence::type_id::create("m_rmw_seq_8");
    rmw_sequence m_rmw_seq_9 = rmw_sequence::type_id::create("m_rmw_seq_9");
    rmw_sequence m_rmw_seq_10 = rmw_sequence::type_id::create("m_rmw_seq_10");
    rmw_sequence m_rmw_seq_11 = rmw_sequence::type_id::create("m_rmw_seq_11");
    rmw_sequence m_rmw_seq_12 = rmw_sequence::type_id::create("m_rmw_seq_12");
    rmw_sequence m_rmw_seq_13 = rmw_sequence::type_id::create("m_rmw_seq_13");
    rmw_sequence m_rmw_seq_14 = rmw_sequence::type_id::create("m_rmw_seq_14");
    rmw_sequence m_rmw_seq_15 = rmw_sequence::type_id::create("m_rmw_seq_15");


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

    // Step 1 -> arbiter test, m0 as the most important for all subordinates
    m_base_seq_0.randomize with {destination_address == 32'h0000_0000;};
    m_base_seq_1.randomize with {destination_address == 32'h0000_0001;};
    m_base_seq_2.randomize with {destination_address == 32'h0000_0002;};
    m_base_seq_3.randomize with {destination_address == 32'h0000_0003;};
    m_base_seq_4.randomize with {destination_address == 32'h0000_0004;};
    m_base_seq_5.randomize with {destination_address == 32'h0000_0005;};
    m_base_seq_6.randomize with {destination_address == 32'h0000_0006;};
    m_base_seq_7.randomize with {destination_address == 32'h0000_0007;};

    regmodel.config_reg_s0.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s1.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s2.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s3.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s4.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s5.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s6.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s7.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s8.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s9.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s10.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s11.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s12.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s13.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s14.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});
    regmodel.config_reg_s15.write(status, {16'b0, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b11});

    // Step 2 -> read recently written data
    regmodel.config_reg_s0.read(status, rdata[0]);
    regmodel.config_reg_s1.read(status, rdata[1]);
    regmodel.config_reg_s2.read(status, rdata[2]);
    regmodel.config_reg_s3.read(status, rdata[3]);
    regmodel.config_reg_s4.read(status, rdata[4]);
    regmodel.config_reg_s5.read(status, rdata[5]);
    regmodel.config_reg_s6.read(status, rdata[6]);
    regmodel.config_reg_s7.read(status, rdata[7]);
    regmodel.config_reg_s8.read(status, rdata[8]);
    regmodel.config_reg_s9.read(status, rdata[9]);
    regmodel.config_reg_s10.read(status, rdata[10]);
    regmodel.config_reg_s11.read(status, rdata[11]);
    regmodel.config_reg_s12.read(status, rdata[12]);
    regmodel.config_reg_s13.read(status, rdata[13]);
    regmodel.config_reg_s14.read(status, rdata[14]);
    regmodel.config_reg_s15.read(status, rdata[15]);

    // Step 3 -> All managers to subordinate 0 at the same time
    fork
      m_base_seq_0.start(m_sequencer_00);
      m_base_seq_1.start(m_sequencer_01);
      m_base_seq_2.start(m_sequencer_02);
      m_base_seq_3.start(m_sequencer_03);
      m_base_seq_4.start(m_sequencer_04);
      m_base_seq_5.start(m_sequencer_05);
      m_base_seq_6.start(m_sequencer_06);
      m_base_seq_7.start(m_sequencer_07);
    join

    // Step 4 -> New config by reset
    regmodel.config_reg_s0.reset();
    regmodel.config_reg_s1.reset();
    regmodel.config_reg_s2.reset();
    regmodel.config_reg_s3.reset();
    regmodel.config_reg_s4.reset();
    regmodel.config_reg_s5.reset();
    regmodel.config_reg_s6.reset();
    regmodel.config_reg_s7.reset();
    regmodel.config_reg_s8.reset();
    regmodel.config_reg_s9.reset();
    regmodel.config_reg_s10.reset();
    regmodel.config_reg_s11.reset();
    regmodel.config_reg_s12.reset();
    regmodel.config_reg_s13.reset();
    regmodel.config_reg_s14.reset();
    regmodel.config_reg_s15.reset();

    // Step 5 -> Read config after reset
    regmodel.config_reg_s0.read(status, rdata[0]);
    regmodel.config_reg_s1.read(status, rdata[1]);
    regmodel.config_reg_s2.read(status, rdata[2]);
    regmodel.config_reg_s3.read(status, rdata[3]);
    regmodel.config_reg_s4.read(status, rdata[4]);
    regmodel.config_reg_s5.read(status, rdata[5]);
    regmodel.config_reg_s6.read(status, rdata[6]);
    regmodel.config_reg_s7.read(status, rdata[7]);
    regmodel.config_reg_s8.read(status, rdata[8]);
    regmodel.config_reg_s9.read(status, rdata[9]);
    regmodel.config_reg_s10.read(status, rdata[10]);
    regmodel.config_reg_s11.read(status, rdata[11]);
    regmodel.config_reg_s12.read(status, rdata[12]);
    regmodel.config_reg_s13.read(status, rdata[13]);
    regmodel.config_reg_s14.read(status, rdata[14]);
    regmodel.config_reg_s15.read(status, rdata[15]);

    // Step 6 -> Block sequence for each subordinate
    m_block_seq_0.randomize with {
      destination_address == 32'h0000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_1.randomize with {
      destination_address == 32'h1000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_2.randomize with {
      destination_address == 32'h2000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_3.randomize with {
      destination_address == 32'h3000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_4.randomize with {
      destination_address == 32'h4000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_5.randomize with {
      destination_address == 32'h5000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_6.randomize with {
      destination_address == 32'h6000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_7.randomize with {
      destination_address == 32'h7000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_8.randomize with {
      destination_address == 32'h8000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_9.randomize with {
      destination_address == 32'h9000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_10.randomize with {
      destination_address == 32'ha000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_11.randomize with {
      destination_address == 32'hb000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_12.randomize with {
      destination_address == 32'hc000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_13.randomize with {
      destination_address == 32'hd000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_14.randomize with {
      destination_address == 32'he000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };
    m_block_seq_15.randomize with {
      destination_address == 32'hf000_0000;
      number_of_transactions == 512;
      s_we == 1;
    };

    fork
      m_block_seq_0.start(m_sequencer_00);
      m_block_seq_1.start(m_sequencer_01);
      m_block_seq_2.start(m_sequencer_02);
      m_block_seq_3.start(m_sequencer_03);
      m_block_seq_4.start(m_sequencer_04);
      m_block_seq_5.start(m_sequencer_05);
      m_block_seq_6.start(m_sequencer_06);
      m_block_seq_7.start(m_sequencer_07);
    join
    fork
      m_block_seq_8.start(m_sequencer_00);
      m_block_seq_9.start(m_sequencer_01);
      m_block_seq_10.start(m_sequencer_02);
      m_block_seq_11.start(m_sequencer_03);
      m_block_seq_12.start(m_sequencer_04);
      m_block_seq_13.start(m_sequencer_05);
      m_block_seq_14.start(m_sequencer_06);
      m_block_seq_15.start(m_sequencer_07);
    join

    // Step 7 -> RMW for each subordinate
    m_rmw_seq_0.randomize with {
      destination_address == 32'h0000_0000;
    };
    m_rmw_seq_1.randomize with {
      destination_address == 32'h1000_0000;
    };
    m_rmw_seq_2.randomize with {
      destination_address == 32'h2000_0000;
    };
    m_rmw_seq_3.randomize with {
      destination_address == 32'h3000_0000;
    };
    m_rmw_seq_4.randomize with {
      destination_address == 32'h4000_0000;
    };
    m_rmw_seq_5.randomize with {
      destination_address == 32'h5000_0000;
    };
    m_rmw_seq_6.randomize with {
      destination_address == 32'h6000_0000;
    };
    m_rmw_seq_7.randomize with {
      destination_address == 32'h7000_0000;
    };
    m_rmw_seq_8.randomize with {
      destination_address == 32'h8000_0000;
    };
    m_rmw_seq_9.randomize with {
      destination_address == 32'h9000_0000;
    };
    m_rmw_seq_10.randomize with {
      destination_address == 32'ha000_0000;
    };
    m_rmw_seq_11.randomize with {
      destination_address == 32'hb000_0000;
    };
    m_rmw_seq_12.randomize with {
      destination_address == 32'hc000_0000;
    };
    m_rmw_seq_13.randomize with {
      destination_address == 32'hd000_0000;
    };
    m_rmw_seq_14.randomize with {
      destination_address == 32'he000_0000;
    };
    m_rmw_seq_15.randomize with {
      destination_address == 32'hf000_0000;
    };

    m_rmw_seq_0.start(m_sequencer_00);
    m_rmw_seq_1.start(m_sequencer_00);
    m_rmw_seq_2.start(m_sequencer_00);
    m_rmw_seq_3.start(m_sequencer_00);
    m_rmw_seq_4.start(m_sequencer_00);
    m_rmw_seq_5.start(m_sequencer_00);
    m_rmw_seq_6.start(m_sequencer_00);
    m_rmw_seq_7.start(m_sequencer_00);
    m_rmw_seq_8.start(m_sequencer_00);
    m_rmw_seq_9.start(m_sequencer_00);
    m_rmw_seq_10.start(m_sequencer_00);
    m_rmw_seq_11.start(m_sequencer_00);
    m_rmw_seq_12.start(m_sequencer_00);
    m_rmw_seq_13.start(m_sequencer_00);
    m_rmw_seq_14.start(m_sequencer_00);
    m_rmw_seq_15.start(m_sequencer_00);

  endtask: body

endclass: base_vseq