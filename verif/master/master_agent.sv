`uvm_analysis_imp_decl(_TX)
`uvm_analysis_imp_decl(_RX)

class master_agent extends uvm_agent;
  `uvm_component_utils(master_agent)

  // Component handlers
  master_driver m_driver_h;
  master_monitor m_monitor_h;
  //uvm_sequencer#(base_transaction) m_sequencer_h;
  master_sequencer m_sequencer_h;
  string if_number;

  function new(string name="master_agent", uvm_component parent=null);
    super.new(name, parent);
    this.if_number = parse_if_number(name);
  endfunction: new


  function string parse_if_number(string agent_name);
    string temp_number = agent_name.substr(agent_name.len()-2,agent_name.len()-1);
    //$display("M_AGENT parse_if_number() | temp_number: %s, agent_name.len()-2: %s, agent_name.len()-1: %s", temp_number, agent_name[agent_name.len()-2],agent_name[agent_name.len()-1]);
    return temp_number;
  endfunction: parse_if_number

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //$display("M_AGENT | build_phase | is_active: %d", get_is_active());
    if (get_is_active()) begin
      m_driver_h = master_driver::type_id::create("m_driver_h", this, $sformatf("s_vif_%s", if_number));
      m_driver_h.set_vif($sformatf("m_vif_%s",if_number));
      //m_sequencer_h = uvm_sequencer#(base_transaction)::type_id::create("m_sequencer_h", this);
      m_sequencer_h = master_sequencer::type_id::create("m_sequencer_h", this);
    end
    m_monitor_h = master_monitor::type_id::create("m_monitor_h", this);
    m_monitor_h.set_vif($sformatf("m_vif_%s",if_number));
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    if (get_is_active()) begin
      m_driver_h.seq_item_port.connect(m_sequencer_h.seq_item_export);
    end
    uvm_config_db #(master_sequencer)::set(null, "Sequencers", $sformatf("agent_%s_sqr", if_number), m_sequencer_h);
  endfunction: connect_phase

endclass: master_agent
