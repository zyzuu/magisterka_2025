// Class: base_driver
//
class base_driver extends uvm_driver#(base_transaction);
    `uvm_component_utils(base_driver)
    
    // Parameters
    parameter int TRANSACTION_DELAY = 100; // unit: us
    
    // Virtual interface
    virtual base_if.master_if m_vif;

    function new(string name = "base_driver", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual base_if.master_if)::get(this, "", "base_if.master_if", m_vif))
        `uvm_fatal(get_type_name(), "Could not get m_vif from factory")
    endfunction: build_phase

    task void run_phase(uvm_phase phase);
        base_transaction m_base_transaction;
        forever begin
            // Transaction begin
            seq_item_port.get_next_item(m_base_transaction); // This method blocks until a REQ sequence_item is available in the sequencer.
            `uvm_info(get_type_name(), "After get_next_item call!", UVM_HIGH);
            #(TRANSACTION_DELAY * 1us);
        
            // Pin wiggles
            m_vif.data_in = m_base_transaction.data_in;
            m_vif.addr = m_base_transaction.addr;
            m_vif.sel = m_base_transaction.sel;
            m_vif.we = m_base_transaction.we;
            m_vif.cyc = m_base_transaction.cyc;
            m_vif.stb = m_base_transaction.stb;
            m_vif.data_out = m_base_transaction.data_out;
            m_vif.ack = m_base_transaction.ack;
            m_vif.err = m_base_transaction.err;
            m_vif.rty = m_base_transaction.rty;
        
            // Transaction complete
            seq_item_port.item_done();
            `uvm_info(get_type_name(), "After item_done call!", UVM_HIGH);
        end
    endtask: run_phase
endclass: base_driver