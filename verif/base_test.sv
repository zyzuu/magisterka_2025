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
    seq.start(env.m_agent0.m_sequencer_h);
    seq.start(env.m_agent1.m_sequencer_h);
    seq.start(env.m_agent2.m_sequencer_h);
    seq.start(env.m_agent3.m_sequencer_h);
    seq.start(env.m_agent4.m_sequencer_h);
    seq.start(env.m_agent5.m_sequencer_h);
    seq.start(env.m_agent6.m_sequencer_h);
    seq.start(env.m_agent7.m_sequencer_h);

    seq.start(env.s_agent0.s_sequencer_h);
    seq.start(env.s_agent1.s_sequencer_h);
    seq.start(env.s_agent2.s_sequencer_h);
    seq.start(env.s_agent3.s_sequencer_h);
    seq.start(env.s_agent4.s_sequencer_h);
    seq.start(env.s_agent5.s_sequencer_h);
    seq.start(env.s_agent6.s_sequencer_h);
    seq.start(env.s_agent7.s_sequencer_h);
    seq.start(env.s_agent8.s_sequencer_h);
    seq.start(env.s_agent9.s_sequencer_h);
    seq.start(env.s_agent10.s_sequencer_h);
    seq.start(env.s_agent11.s_sequencer_h);
    seq.start(env.s_agent12.s_sequencer_h);
    seq.start(env.s_agent13.s_sequencer_h);
    seq.start(env.s_agent14.s_sequencer_h);
    seq.start(env.s_agent15.s_sequencer_h);
    phase.drop_objection(this);
  endtask: run_phase
endclass: base_test
