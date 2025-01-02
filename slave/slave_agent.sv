class slave_agent extends uvm_agent;
    `uvm_component_utils(slave_agent)
    
    // Component handlers
    slave_driver s_driver_h;
    slave_monitor s_monitor_h;
    uvm_sequencer#(m_base_transaction) s_sequencer_h;

    function void new(string name="slave_agent", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        if (get_is_active()) begin
            s_driver_h = slave_driver::type_id::create("s_driver_h", this);
            s_sequencer_h uvm_sequencer#(m_base_transaction)::type_id::create("s_sequencer_h", this);
        end
        s_monitor_h = slave_monitor::type_id::create("s_monitor_h", this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        if (get_is_active()) begin
            s_driver_h.seq_item_port.connect(s_sequencer_h.seq_item_export);
        end
    endfunction: connect_phase

endclass: slave_agent