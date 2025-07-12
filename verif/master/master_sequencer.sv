class master_sequencer extends uvm_sequencer#(base_transaction);
  `uvm_component_utils(master_sequencer)

  ///////////////////////////////////////////////////////////////////////////////
  //constructor
  ///////////////////////////////////////////////////////////////////////////////
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction : new
endclass : master_sequencer