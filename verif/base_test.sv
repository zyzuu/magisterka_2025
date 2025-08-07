class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  base_env env;
  base_vseq vseq;

  function new(string name="base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = base_env::type_id::create("env", this);
    vseq = base_vseq::type_id::create("vseq");
  endfunction: build_phase


  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    wait(!env.m_agent_00.m_driver_h.m_vif.rst_i);
    vseq.start(null);
    phase.drop_objection(this);
  endtask: run_phase
endclass: base_test
