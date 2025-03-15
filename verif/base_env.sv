class base_env extends uvm_env;
  `uvm_component_utils(base_env)
  // Master side
  master_agent m_agent0;
  master_agent m_agent1;
  master_agent m_agent2;
  master_agent m_agent3;
  master_agent m_agent4;
  master_agent m_agent5;
  master_agent m_agent6;
  master_agent m_agent7;

  // Slave side
  slave_agent s_agent0;
  slave_agent s_agent1;
  slave_agent s_agent2;
  slave_agent s_agent3;
  slave_agent s_agent4;
  slave_agent s_agent5;
  slave_agent s_agent6;
  slave_agent s_agent7;
  slave_agent s_agent8;
  slave_agent s_agent9;
  slave_agent s_agent10;
  slave_agent s_agent11;
  slave_agent s_agent12;
  slave_agent s_agent13;
  slave_agent s_agent14;
  slave_agent s_agent15;


  function new(string name="base_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    m_agent0 = master_agent::type_id::create("m_agent0", this, 0);
    m_agent1 = master_agent::type_id::create("m_agent1", this, 1);
    m_agent2 = master_agent::type_id::create("m_agent2", this, 2);
    m_agent3 = master_agent::type_id::create("m_agent3", this, 3);
    m_agent4 = master_agent::type_id::create("m_agent4", this, 4);
    m_agent5 = master_agent::type_id::create("m_agent5", this, 5);
    m_agent6 = master_agent::type_id::create("m_agent6", this, 6);
    m_agent7 = master_agent::type_id::create("m_agent7", this, 7);

    s_agent0 = slave_agent::type_id::create("s_agent0", this, 0);
    s_agent1 = slave_agent::type_id::create("s_agent1", this, 1);
    s_agent2 = slave_agent::type_id::create("s_agent2", this, 2);
    s_agent3 = slave_agent::type_id::create("s_agent3", this, 3);
    s_agent4 = slave_agent::type_id::create("s_agent4", this, 4);
    s_agent5 = slave_agent::type_id::create("s_agent5", this, 5);
    s_agent6 = slave_agent::type_id::create("s_agent6", this, 6);
    s_agent7 = slave_agent::type_id::create("s_agent7", this, 7);
    s_agent8 = slave_agent::type_id::create("s_agent8", this, 8);
    s_agent9 = slave_agent::type_id::create("s_agent9", this, 9);
    s_agent10 = slave_agent::type_id::create("s_agent10", this, 10);
    s_agent11 = slave_agent::type_id::create("s_agent11", this, 11);
    s_agent12 = slave_agent::type_id::create("s_agent12", this, 12);
    s_agent13 = slave_agent::type_id::create("s_agent13", this, 13);
    s_agent14 = slave_agent::type_id::create("s_agent14", this, 14);
    s_agent15 = slave_agent::type_id::create("s_agent15", this, 15);
  endfunction: build_phase

endclass