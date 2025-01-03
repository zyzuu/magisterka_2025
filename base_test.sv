class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    base_env env;
    base_sequence seq;

    function void new(string name="base_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        env = base_env::type_id::create("env", this);
        seq = base_sequence::type_id::create("seq");
    endfunction: build_phase

    task void run_phase(uvm_phase phase);
        phase.raise_objection(this);
        seq.start(env.m_agent0.sequencer);
        seq.start(env.m_agent1.sequencer);
        seq.start(env.m_agent2.sequencer);
        seq.start(env.m_agent3.sequencer);
        seq.start(env.m_agent4.sequencer);
        seq.start(env.m_agent5.sequencer);
        seq.start(env.m_agent6.sequencer);
        seq.start(env.m_agent7.sequencer);

        seq.start(env.s_agent0.sequencer);
        seq.start(env.s_agent1.sequencer);
        seq.start(env.s_agent2.sequencer);
        seq.start(env.s_agent3.sequencer);
        seq.start(env.s_agent4.sequencer);
        seq.start(env.s_agent5.sequencer);
        seq.start(env.s_agent6.sequencer);
        seq.start(env.s_agent7.sequencer);
        seq.start(env.s_agent8.sequencer);
        seq.start(env.s_agent9.sequencer);
        seq.start(env.s_agent10.sequencer);
        seq.start(env.s_agent11.sequencer);
        seq.start(env.s_agent12.sequencer);
        seq.start(env.s_agent13.sequencer);
        seq.start(env.s_agent14.sequencer);
        seq.start(env.s_agent15.sequencer);
        phase.drop_objection(this);
    endtask: run_phase
endclass: base_test