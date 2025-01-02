class master_agent extends uvm_agent;
    `uvm_component_utils(master_agent)
    
    // Component handlers
    master_driver m_driver_h;
    master_monitor m_monitor_h;
    uvm_sequencer#(m_base_transaction) m_sequencer_h;

    function void new(string name="master_agent", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        if (get_is_active()) begin
            m_driver_h = master_driver::type_id::create("m_driver_h", this);
            m_sequencer_h uvm_sequencer#(m_base_transaction)::type_id::create("m_sequencer_h", this);
        end
        m_monitor_h = master_monitor::type_id::create("m_monitor_h", this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        if (get_is_active()) begin
            m_driver_h.seq_item_port.connect(m_sequencer_h.seq_item_export);
        end
    endfunction: connect_phase

endclass: master_agent