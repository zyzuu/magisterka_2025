class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  base_env env;
  base_sequence seq;

  function new(string name="base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    env = base_env::type_id::create("env", this);
    seq = base_sequence::type_id::create("seq");
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.m_agent_00.m_sequencer_h);
    seq.start(env.m_agent_01.m_sequencer_h);
    seq.start(env.m_agent_02.m_sequencer_h);
    seq.start(env.m_agent_03.m_sequencer_h);
    seq.start(env.m_agent_04.m_sequencer_h);
    seq.start(env.m_agent_05.m_sequencer_h);
    seq.start(env.m_agent_06.m_sequencer_h);
    seq.start(env.m_agent_07.m_sequencer_h);

    seq.start(env.s_agent_00.s_sequencer_h);
    seq.start(env.s_agent_01.s_sequencer_h);
    seq.start(env.s_agent_02.s_sequencer_h);
    seq.start(env.s_agent_03.s_sequencer_h);
    seq.start(env.s_agent_04.s_sequencer_h);
    seq.start(env.s_agent_05.s_sequencer_h);
    seq.start(env.s_agent_06.s_sequencer_h);
    seq.start(env.s_agent_07.s_sequencer_h);
    seq.start(env.s_agent_08.s_sequencer_h);
    seq.start(env.s_agent_09.s_sequencer_h);
    seq.start(env.s_agent_10.s_sequencer_h);
    seq.start(env.s_agent_11.s_sequencer_h);
    seq.start(env.s_agent_12.s_sequencer_h);
    seq.start(env.s_agent_13.s_sequencer_h);
    seq.start(env.s_agent_14.s_sequencer_h);
    seq.start(env.s_agent_15.s_sequencer_h);
    phase.drop_objection(this);
  endtask: run_phase
endclass: base_test
