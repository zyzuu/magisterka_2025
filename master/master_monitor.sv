class master_monitor extends uvm_monitor;
    `uvm_component_utils(master_monitor)
    
    // Virtual interface
    virtual base_if.master_if m_vif;
    
    // Analysis port
    uvm_analysis_port#(base_transaction) ap;

    function new(string name = "master_monitor", uvm_component parent=null);
    super.new(name, parent);
    ap = new("ap", this);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual base_if.master_if)::get(this, "", "base_if.master_if", m_vif))
        `uvm_fatal(get_type_name(), "Could not get m_vif from factory")
    endfunction: build_phase

    task void run_phase(uvm_phase phase);
        base_transaction m_base_transaction;
        forever begin
            @(posedge m_vif.clk);
            m_base_transaction.data_in <= m_vif.we ? m_vif.data_in : 0;
            m_base_transaction.addr <= m_vif.addr;
            m_base_transaction.sel <= m_vif.sel;
            m_base_transaction.we <= m_vif.we;
            m_base_transaction.operation <= m_vif.we;
            m_base_transaction.cyc <= m_vif.cyc;
            m_base_transaction.stb <= m_vif.stb;
            m_base_transaction.data_out <= !m_vif.we ? m_vif.data_out : 0;
            m_base_transaction.ack <= m_vif.ack;
            m_base_transaction.err <= m_vif.err;
            m_base_transaction.rty <= m_vif.rty;
            ap.write(m_base_transaction);
        end
    endtask: run_phase


endclass: master_monitor