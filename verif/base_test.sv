class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  base_env env;
  base_vseq vseq;
  config_block regmodel;

  function new(string name="base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    env = base_env::type_id::create("env", this);
    vseq = base_vseq::type_id::create("vseq");
    super.build_phase(phase);
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
  endfunction : connect_phase


  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    vseq.regmodel = regmodel;
    wait(!env.m_agent_00.m_driver_h.m_vif.rst_i);
    vseq.start(null);
    phase.drop_objection(this);
  endtask: run_phase
endclass: base_test
