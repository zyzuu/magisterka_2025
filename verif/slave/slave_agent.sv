class slave_agent extends uvm_agent;
  `uvm_component_utils(slave_agent)

  // Component handlers
  slave_driver s_driver_h;
  slave_monitor s_monitor_h;
  //uvm_sequencer#(base_transaction) s_sequencer_h;
  slave_sequencer s_sequencer_h;

  string if_number;

  function new(string name="slave_agent", uvm_component parent=null);
    super.new(name, parent);
    this.if_number = parse_if_number(name);
    //$display("S_AGENT new() | name: %s, if_number: %d", name, if_number);
  endfunction: new

  function string parse_if_number(string agent_name);
    string temp_number = agent_name.substr(agent_name.len()-2,agent_name.len()-1);
    //$display("S_AGENT parse_if_number() | temp_number: %s, agent_name.len()-2: %s, agent_name.len()-1: %s", temp_number, agent_name[agent_name.len()-2],agent_name[agent_name.len()-1]);
    return temp_number;
  endfunction: parse_if_number

  function void build_phase(uvm_phase phase);
    if (get_is_active()) begin
      s_driver_h = slave_driver::type_id::create("s_driver_h", this);
      s_driver_h.set_vif($sformatf("s_vif_%s",if_number));
      s_sequencer_h = slave_sequencer::type_id::create("s_sequencer_h", this);
    end
    s_monitor_h = slave_monitor::type_id::create("s_monitor_h", this);
    s_monitor_h.set_vif($sformatf("s_vif_%s",if_number));
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    if (get_is_active()) begin
      s_driver_h.seq_item_port.connect(s_sequencer_h.seq_item_export);
    end
  endfunction: connect_phase

endclass: slave_agent
