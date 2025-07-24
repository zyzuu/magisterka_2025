class base_env extends uvm_env;
  `uvm_component_utils(base_env)
  // Master side
  master_agent m_agent_00;
  master_agent m_agent_01;
  master_agent m_agent_02;
  master_agent m_agent_03;
  master_agent m_agent_04;
  master_agent m_agent_05;
  master_agent m_agent_06;
  master_agent m_agent_07;

  // Slave side
  slave_agent s_agent_00;
  slave_agent s_agent_01;
  slave_agent s_agent_02;
  slave_agent s_agent_03;
  slave_agent s_agent_04;
  slave_agent s_agent_05;
  slave_agent s_agent_06;
  slave_agent s_agent_07;
  slave_agent s_agent_08;
  slave_agent s_agent_09;
  slave_agent s_agent_10;
  slave_agent s_agent_11;
  slave_agent s_agent_12;
  slave_agent s_agent_13;
  slave_agent s_agent_14;
  slave_agent s_agent_15;


  function new(string name="base_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    m_agent_00 = master_agent::type_id::create("m_agent_00", this);
    m_agent_01 = master_agent::type_id::create("m_agent_01", this);
    m_agent_02 = master_agent::type_id::create("m_agent_02", this);
    m_agent_03 = master_agent::type_id::create("m_agent_03", this);
    m_agent_04 = master_agent::type_id::create("m_agent_04", this);
    m_agent_05 = master_agent::type_id::create("m_agent_05", this);
    m_agent_06 = master_agent::type_id::create("m_agent_06", this);
    m_agent_07 = master_agent::type_id::create("m_agent_07", this);

    s_agent_00 = slave_agent::type_id::create("s_agent_00", this);
    s_agent_01 = slave_agent::type_id::create("s_agent_01", this);
    s_agent_02 = slave_agent::type_id::create("s_agent_02", this);
    s_agent_03 = slave_agent::type_id::create("s_agent_03", this);
    s_agent_04 = slave_agent::type_id::create("s_agent_04", this);
    s_agent_05 = slave_agent::type_id::create("s_agent_05", this);
    s_agent_06 = slave_agent::type_id::create("s_agent_06", this);
    s_agent_07 = slave_agent::type_id::create("s_agent_07", this);
    s_agent_08 = slave_agent::type_id::create("s_agent_08", this);
    s_agent_09 = slave_agent::type_id::create("s_agent_09", this);
    s_agent_10 = slave_agent::type_id::create("s_agent_10", this);
    s_agent_11 = slave_agent::type_id::create("s_agent_11", this);
    s_agent_12 = slave_agent::type_id::create("s_agent_12", this);
    s_agent_13 = slave_agent::type_id::create("s_agent_13", this);
    s_agent_14 = slave_agent::type_id::create("s_agent_14", this);
    s_agent_15 = slave_agent::type_id::create("s_agent_15", this);
  endfunction: build_phase
endclass