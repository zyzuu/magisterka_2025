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
        m_agent0 = master_agent::type_id::create("m_agent0", this);
        m_agent1 = master_agent::type_id::create("m_agent1", this);
        m_agent2 = master_agent::type_id::create("m_agent2", this);
        m_agent3 = master_agent::type_id::create("m_agent3", this);
        m_agent4 = master_agent::type_id::create("m_agent4", this);
        m_agent5 = master_agent::type_id::create("m_agent5", this);
        m_agent6 = master_agent::type_id::create("m_agent6", this);
        m_agent7 = master_agent::type_id::create("m_agent7", this);

        s_agent0 = slave_agent::type_id::create("s_agent0", this);
        s_agent1 = slave_agent::type_id::create("s_agent1", this);
        s_agent2 = slave_agent::type_id::create("s_agent2", this);
        s_agent3 = slave_agent::type_id::create("s_agent3", this);
        s_agent4 = slave_agent::type_id::create("s_agent4", this);
        s_agent5 = slave_agent::type_id::create("s_agent5", this);
        s_agent6 = slave_agent::type_id::create("s_agent6", this);
        s_agent7 = slave_agent::type_id::create("s_agent7", this);
        s_agent8 = slave_agent::type_id::create("s_agent8", this);
        s_agent9 = slave_agent::type_id::create("s_agent9", this);
        s_agent10 = slave_agent::type_id::create("s_agent10", this);
        s_agent11 = slave_agent::type_id::create("s_agent11", this);
        s_agent12 = slave_agent::type_id::create("s_agent12", this);
        s_agent13 = slave_agent::type_id::create("s_agent13", this);
        s_agent14 = slave_agent::type_id::create("s_agent14", this);
        s_agent15 = slave_agent::type_id::create("s_agent15", this);
    endfunction: build_phase

endclass