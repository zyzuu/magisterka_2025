class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  base_env env;
  base_vseq vseq;

  function new(string name="base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    env = base_env::type_id::create("env", this);
    vseq = base_vseq::type_id::create("vseq");
  endfunction: build_phase

  function void connect_vseq(base_vseq vseq);

  vseq.m_sequencer_00 = env.m_agent_00.m_sequencer_h;
  vseq.m_sequencer_01 = env.m_agent_01.m_sequencer_h;
  vseq.m_sequencer_02 = env.m_agent_02.m_sequencer_h;
  vseq.m_sequencer_03 = env.m_agent_03.m_sequencer_h;
  vseq.m_sequencer_04 = env.m_agent_04.m_sequencer_h;
  vseq.m_sequencer_05 = env.m_agent_05.m_sequencer_h;
  vseq.m_sequencer_06 = env.m_agent_06.m_sequencer_h;
  vseq.m_sequencer_07 = env.m_agent_07.m_sequencer_h;

  vseq.s_sequencer_00 = env.s_agent_00.s_sequencer_h;
  vseq.s_sequencer_01 = env.s_agent_01.s_sequencer_h;
  vseq.s_sequencer_02 = env.s_agent_02.s_sequencer_h;
  vseq.s_sequencer_03 = env.s_agent_03.s_sequencer_h;
  vseq.s_sequencer_04 = env.s_agent_04.s_sequencer_h;
  vseq.s_sequencer_05 = env.s_agent_05.s_sequencer_h;
  vseq.s_sequencer_06 = env.s_agent_06.s_sequencer_h;
  vseq.s_sequencer_07 = env.s_agent_07.s_sequencer_h;
  vseq.s_sequencer_08 = env.s_agent_08.s_sequencer_h;
  vseq.s_sequencer_09 = env.s_agent_09.s_sequencer_h;
  vseq.s_sequencer_10 = env.s_agent_10.s_sequencer_h;
  vseq.s_sequencer_11 = env.s_agent_11.s_sequencer_h;
  vseq.s_sequencer_12 = env.s_agent_12.s_sequencer_h;
  vseq.s_sequencer_13 = env.s_agent_13.s_sequencer_h;
  vseq.s_sequencer_14 = env.s_agent_14.s_sequencer_h;
  vseq.s_sequencer_15 = env.s_agent_15.s_sequencer_h;

  endfunction: connect_vseq

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    connect_vseq(vseq);
    vseq.start(null);
    //seq.start(env.m_agent_00.m_sequencer_h);
    //seq.start(env.m_agent_01.m_sequencer_h);
    //seq.start(env.m_agent_02.m_sequencer_h);
    //seq.start(env.m_agent_03.m_sequencer_h);
    //seq.start(env.m_agent_04.m_sequencer_h);
    //seq.start(env.m_agent_05.m_sequencer_h);
    //seq.start(env.m_agent_06.m_sequencer_h);
    //seq.start(env.m_agent_07.m_sequencer_h);
//
    //seq.start(env.s_agent_00.s_sequencer_h);
    //seq.start(env.s_agent_01.s_sequencer_h);
    //seq.start(env.s_agent_02.s_sequencer_h);
    //seq.start(env.s_agent_03.s_sequencer_h);
    //seq.start(env.s_agent_04.s_sequencer_h);
    //seq.start(env.s_agent_05.s_sequencer_h);
    //seq.start(env.s_agent_06.s_sequencer_h);
    //seq.start(env.s_agent_07.s_sequencer_h);
    //seq.start(env.s_agent_08.s_sequencer_h);
    //seq.start(env.s_agent_09.s_sequencer_h);
    //seq.start(env.s_agent_10.s_sequencer_h);
    //seq.start(env.s_agent_11.s_sequencer_h);
    //seq.start(env.s_agent_12.s_sequencer_h);
    //seq.start(env.s_agent_13.s_sequencer_h);
    //seq.start(env.s_agent_14.s_sequencer_h);
    //seq.start(env.s_agent_15.s_sequencer_h);
    phase.drop_objection(this);
  endtask: run_phase
endclass: base_test
