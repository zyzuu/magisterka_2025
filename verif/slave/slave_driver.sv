// Class: slave_driver
//
class slave_driver extends uvm_driver#(base_transaction);
  `uvm_component_utils(slave_driver)

  // Parameters
  parameter int TRANSACTION_DELAY = 100; // unit: us
  logic [31:0] memory [1023:0];

  // Virtual interface
  virtual base_if s_vif;
  string if_name;

  function new(string name = "slave_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction: build_phase

  function void set_vif(string if_name);
    $display("S_DRIVER set_vif() | if_name: %s", if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "uvm_test_top", if_name, s_vif))
    `uvm_fatal(get_type_name(), $sformatf("Could not get %s from factory", if_name))
  endfunction: set_vif

  task run_phase(uvm_phase phase);
    base_transaction m_base_transaction;
    forever begin
      // Transaction begin
      seq_item_port.get_next_item(m_base_transaction); // This method blocks until a REQ sequence_item is available in the sequencer.
      `uvm_info(get_type_name(), "After get_next_item call!", UVM_LOW);
      // Pin wiggles
      drive_data(m_base_transaction);

      // Transaction complete
      seq_item_port.item_done();
      `uvm_info(get_type_name(), "After item_done call!", UVM_LOW);
    end
  endtask: run_phase

  task drive_data(base_transaction m_base_transaction);
    do begin
      @(posedge s_vif.clk_i)

      if (!s_vif.rst_i) begin
        // TODO: READ AND WRITE
        if(s_vif.cyc == 1 && s_vif.stb == 1 && s_vif.we == 0) begin // SINGLE READ CYCLE
          s_vif.ack <= 1;
          s_vif.data_out <= memory[s_vif.addr];
        end
        if(s_vif.cyc == 1 && s_vif.stb == 1 && s_vif.we == 1) begin
          s_vif.ack <= 1;
          memory[s_vif.addr] <= s_vif.data_in;
        end
      end

      else begin // Reset actions
        `uvm_info(get_type_name(), "Entered reset state!", UVM_DEBUG)
        wait (s_vif.clk_i)

        s_vif.data_in <= 0;
        s_vif.addr <= 0;
        s_vif.sel <= 0;
        s_vif.we <= 0;
        s_vif.cyc <= 0;
        s_vif.stb <= 0;
        s_vif.data_out <= 0;
        s_vif.ack <= 0;
        s_vif.err <= 0;
        s_vif.rty <= 0;
        @(negedge s_vif.clk_i)
        `uvm_info(get_type_name(), "Reset done!", UVM_LOW)
      end
    end
    while(!s_vif.rst_i);
  endtask: drive_data
endclass: slave_driver