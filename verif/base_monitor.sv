class base_monitor extends uvm_monitor;
    `uvm_component_utils(base_monitor)

    

    function new(string name = "base_monitor", uvm_component parent=null);
    super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual base_if.master_if)::get(this, "", "base_if.master_if", m_vif))
        `uvm_fatal(get_type_name(), "Could not get m_vif from factory")
    endfunction: build_phase

endclass: base_monitor