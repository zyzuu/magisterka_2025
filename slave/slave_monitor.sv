class slave_monitor extends uvm_monitor;
    `uvm_component_utils(slave_monitor)
    
    // Virtual interface
    virtual base_if.slave_if s_vif;
    
    // Analysis port
    uvm_analysis_port#(base_transaction) ap;

    function new(string name = "slave_monitor", uvm_component parent=null);
    super.new(name, parent);
    ap = new("ap", this);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual base_if.slave_if)::get(this, "", "base_if.slave_if", s_vif))
        `uvm_fatal(get_type_name(), "Could not get s_vif from factory")
    endfunction: build_phase

    task void run_phase(uvm_phase phase);
        base_transaction m_base_transaction;
        forever begin
            @(posedge s_vif.clk);
            m_base_transaction.data_in <= s_vif.we ? s_vif.data_in : 0;
            m_base_transaction.addr <= s_vif.addr;
            m_base_transaction.sel <= s_vif.sel;
            m_base_transaction.we <= s_vif.we;
            m_base_transaction.operation <= s_vif.we;
            m_base_transaction.cyc <= s_vif.cyc;
            m_base_transaction.stb <= s_vif.stb;
            m_base_transaction.data_out <= !s_vif.we ? s_vif.data_out : 0;
            m_base_transaction.ack <= s_vif.ack;
            m_base_transaction.err <= s_vif.err;
            m_base_transaction.rty <= s_vif.rty;
            ap.write(m_base_transaction);
        end
    endtask: run_phase


endclass: slave_monitor