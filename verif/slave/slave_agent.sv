class slave_agent extends uvm_agent;
  `uvm_component_utils(slave_agent)

  slave_driver s_driver_h;
  slave_monitor s_monitor_h;
  slave_sequencer s_sequencer_h;

  virtual base_if s_vif;
  string if_number;

  function new(string name="slave_agent", uvm_component parent=null);
    super.new(name, parent);
    this.if_number = parse_if_number(name);
  endfunction : new

  function string parse_if_number(string agent_name);
    string temp_number = agent_name.substr(agent_name.len()-2,agent_name.len()-1);
    return temp_number;
  endfunction : parse_if_number

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual base_if)::get(this, "", $sformatf("s_vif_%s", if_number), s_vif))
      `uvm_fatal(get_type_name(), $sformatf("Could not get %s from factory", "if_name"))

    uvm_config_db#(virtual base_if)::set(this, "s_monitor_h", "s_vif", s_vif);
    uvm_config_db#(virtual base_if)::set(this, "s_driver_h", "s_vif", s_vif);

    if (get_is_active()) begin
      s_driver_h = slave_driver::type_id::create("s_driver_h", this);
      s_sequencer_h = slave_sequencer::type_id::create("s_sequencer_h", this);
    end
    s_monitor_h = slave_monitor::type_id::create("s_monitor_h", this);
  endfunction : build_phase

  function void connect_phase(uvm_phase phase);
    if (get_is_active()) begin
      s_driver_h.seq_item_port.connect(s_sequencer_h.seq_item_export);
    end
  endfunction : connect_phase

endclass: slave_agent
