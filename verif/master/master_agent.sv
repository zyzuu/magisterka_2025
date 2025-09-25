class master_agent extends uvm_agent;
  `uvm_component_utils(master_agent)

  master_driver m_driver_h;
  master_monitor m_monitor_h;
  master_sequencer m_sequencer_h;
  reg2wb_adapter m_reg_adapter_h;

  virtual base_if m_vif;
  string if_number;
  bit with_reg_adapter;

  function new(string name="master_agent", uvm_component parent=null);
    super.new(name, parent);
    this.with_reg_adapter = is_ral_agent(name);
    if(!this.with_reg_adapter) this.if_number = parse_if_number(name);
    else this.if_number = "00";
  endfunction : new

  function string parse_if_number(string agent_name);
    return agent_name.substr(agent_name.len()-2,agent_name.len()-1);
  endfunction : parse_if_number

  function bit is_ral_agent(string agent_name);
    string ral_from_name = agent_name.substr(agent_name.len()-3, agent_name.len()-1);
    return ral_from_name == "ral" ? 1 : 0;;
  endfunction : is_ral_agent

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual base_if)::get(this, "", $sformatf("m_vif_%s", if_number), m_vif))
      `uvm_fatal(get_type_name(), $sformatf("Could not get m_vif_%s from factory", if_number))

    uvm_config_db#(virtual base_if)::set(this, "m_monitor_h", "m_vif", m_vif);
    uvm_config_db#(virtual base_if)::set(this, "m_driver_h", "m_vif", m_vif);

    if (get_is_active()) begin
      m_driver_h = master_driver::type_id::create("m_driver_h", this, $sformatf("s_vif_%s", if_number));
      m_sequencer_h = master_sequencer::type_id::create("m_sequencer_h", this);
    end

    m_monitor_h = master_monitor::type_id::create("m_monitor_h", this);

    if (with_reg_adapter) begin
      m_reg_adapter_h = reg2wb_adapter::type_id::create("m_reg_adapter_h", ,get_full_name());
    end
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    if (get_is_active()) begin
      m_driver_h.seq_item_port.connect(m_sequencer_h.seq_item_export);
    end
    if (!with_reg_adapter)
      uvm_config_db #(master_sequencer)::set(null, "Sequencers", $sformatf("agent_%s_sqr", if_number), m_sequencer_h);
    else
      uvm_config_db #(master_sequencer)::set(null, "Sequencers", "agent_ral_sqr", m_sequencer_h);
  endfunction: connect_phase

endclass: master_agent
