class arbiter_test extends base_test;
  `uvm_component_utils(arbiter_test)

    master_sequencer m_sequencer_00;
    master_sequencer m_sequencer_01;
    master_sequencer m_sequencer_02;
    master_sequencer m_sequencer_03;
    master_sequencer m_sequencer_04;
    master_sequencer m_sequencer_05;
    master_sequencer m_sequencer_06;
    master_sequencer m_sequencer_07;

  function new(string name="arbiter_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    env = base_env::type_id::create("env", this);
    vseq = base_vseq::type_id::create("vseq");
    uvm_config_db#(bit)::set(env,"s_agent_??.?_driver_h","insert_wait_state",1);
    uvm_config_db#(bit)::set(env,"m_agent_??.m_driver_h","insert_wait_state",0);
    uvm_config_db#(int)::set(env,"s_agent_??.s_driver_h","wait_state_duration",50);
    uvm_config_db#(int)::set(env,"m_agent_??.m_driver_h","wait_state_duration",0);

    regmodel = config_block::type_id::create("regmodel", this);
    regmodel.build();
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    env.m_reg_predictor.map = regmodel.reg_map;
    regmodel.reg_map.set_sequencer(.sequencer(env.m_agent_ral.m_sequencer_h), .adapter(env.m_agent_ral.m_reg_adapter_h));
    regmodel.default_map.set_base_addr(32'hff00_0000);

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
  endfunction : connect_phase


  task run_phase(uvm_phase phase);
    base_sequence m_base_seq_0 = base_sequence::type_id::create("m_base_seq_0");
    base_sequence m_base_seq_1 = base_sequence::type_id::create("m_base_seq_1");
    base_sequence m_base_seq_2 = base_sequence::type_id::create("m_base_seq_2");
    base_sequence m_base_seq_3 = base_sequence::type_id::create("m_base_seq_3");
    base_sequence m_base_seq_4 = base_sequence::type_id::create("m_base_seq_4");
    base_sequence m_base_seq_5 = base_sequence::type_id::create("m_base_seq_5");
    base_sequence m_base_seq_6 = base_sequence::type_id::create("m_base_seq_6");
    base_sequence m_base_seq_7 = base_sequence::type_id::create("m_base_seq_7");
    uvm_status_e status;
    bit [1:0] prios [int];
    int data;
    prios = '{7 : 2'b00,
              6 : 2'b01,
              5 : 2'b01,
              4 : 2'b01,
              3 : 2'b11,
              2 : 2'b11,
              1 : 2'b00,
              0 : 2'b11};
    phase.raise_objection(this);

    wait(!env.m_agent_00.m_driver_h.m_vif.rst_i);

    env.m_arbiter_scoreboard.prios = prios;

    regmodel.config_reg_s0.write(status, {16'b0, prios[7], prios[6], prios[5], prios[4], prios[3], prios[2], prios[1], prios[0]});

    m_base_seq_0.randomize with {destination_address == 32'h0000_0000;};
    m_base_seq_1.randomize with {destination_address == 32'h0000_0001;};
    m_base_seq_2.randomize with {destination_address == 32'h0000_0002;};
    m_base_seq_3.randomize with {destination_address == 32'h0000_0003;};
    m_base_seq_4.randomize with {destination_address == 32'h0000_7777;};
    m_base_seq_5.randomize with {destination_address == 32'h0000_0777;};
    m_base_seq_6.randomize with {destination_address == 32'h0000_0077;};
    m_base_seq_7.randomize with {destination_address == 32'h0000_0007;};

    fork
      m_base_seq_0.start(m_sequencer_00);
      m_base_seq_1.start(m_sequencer_01);
      m_base_seq_2.start(m_sequencer_02);
      m_base_seq_3.start(m_sequencer_03);
      m_base_seq_4.start(m_sequencer_07);
      m_base_seq_5.start(m_sequencer_07);
      m_base_seq_6.start(m_sequencer_07);
      m_base_seq_7.start(m_sequencer_07);
    join

    phase.drop_objection(this);
  endtask: run_phase
endclass: arbiter_test
