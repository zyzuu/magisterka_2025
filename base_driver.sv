// Class: base_driver
//
class base_driver extends uvm_driver#(base_transaction);
    `uvm_component_utils(base_driver)
    
    // Parameters
    parameter int TRANSACTION_DELAY = 100;
    
    // Virtual interface
    virtual dut_if vif;

    function new(string name = "base_driver", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual dut_if)::get(this, "", "dut_if", vif))
        `uvm_fatal(get_type_name(), "Could not get vif from factory")
    endfunction: build_phase

    task void run_phase(uvm_phase phase);
        forever begin
        seq_item_port.get_next_item(); // This method blocks until a REQ sequence_item is available in the sequencer.
        `uvm_info(get_type_name(), "After get_next_item call!", UVM_HIGH);
        #(TRANSACTION_DELAY * 1us);
        seq_item_port.item_done();
        `uvm_info(get_type_name(), "After item_done call!", UVM_HIGH);
        end
    endtask: run_phase
endclass: base_driver