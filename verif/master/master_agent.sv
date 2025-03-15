class master_agent extends uvm_agent;
  `uvm_component_utils(master_agent)

  // Component handlers
  master_driver m_driver_h;
  master_monitor m_monitor_h;
  uvm_sequencer#(base_transaction) m_sequencer_h;
  integer if_number;

  function new(string name="master_agent", uvm_component parent=null, integer if_number);
    super.new(name, parent);
    this.if_number = if_number;
  endfunction: new

  function void build_phase(uvm_phase phase);
    if (get_is_active()) begin
      m_driver_h = master_driver::type_id::create("m_driver_h", this, if_number);
      m_sequencer_h = uvm_sequencer#(base_transaction)::type_id::create("m_sequencer_h", this);
    end
    m_monitor_h = master_monitor::type_id::create("m_monitor_h", this, if_number);
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    if (get_is_active()) begin
      m_driver_h.seq_item_port.connect(m_sequencer_h.seq_item_export);
    end
  endfunction: connect_phase

endclass: master_agent
