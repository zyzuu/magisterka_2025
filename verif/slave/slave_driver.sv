// Class: slave_driver
//
class slave_driver extends uvm_driver#(base_transaction);
  `uvm_component_utils(slave_driver)

  // Parameters
  parameter int TRANSACTION_DELAY = 100; // unit: us
  logic [31:0] memory [*];

  // Virtual interface
  virtual base_if s_vif;
  string if_name;

  function new(string name = "slave_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void set_vif(string if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "uvm_test_top", if_name, s_vif))
    `uvm_fatal(get_type_name(), $sformatf("Could not get %s from factory", if_name))
  endfunction: set_vif

  task run_phase(uvm_phase phase);
    forever begin
      drive_data();
      `uvm_info(get_type_name(), "After item_done call!", UVM_DEBUG);
    end
  endtask: run_phase

  task drive_data();
      if (!s_vif.rst_i) begin
        wait(s_vif.cyc == 1 && s_vif.stb == 1);

        if(s_vif.we == 0) begin
          s_vif.data_out = !memory.exists(s_vif.addr) ? 32'b0 : memory[s_vif.addr];
          `uvm_info(get_type_name(), $sformatf("READ s_vif.addr: %h, s_vif.data_out: %h, s_vif.data_in: %h", s_vif.addr, s_vif.data_out, s_vif.data_in), UVM_DEBUG);
        end
        else begin
          memory[s_vif.addr] = s_vif.data_out;
          `uvm_info(get_type_name(), $sformatf("WRITE s_vif.addr: %h, s_vif.data_out: %h, s_vif.data_in: %h", s_vif.addr, s_vif.data_out, s_vif.data_in), UVM_DEBUG);
        end

        s_vif.ack = 1;
        s_vif.err = 0;
        s_vif.rty = 0;

        @(posedge s_vif.clk_i);
        @(negedge s_vif.clk_i);

        s_vif.ack = 0;
      end
      else begin // Reset actions
        `uvm_info(get_type_name(), "Entered reset state!", UVM_DEBUG)
        //s_vif.data_in = 0;
        //s_vif.addr = 0;
        //s_vif.sel = 0;
        //s_vif.we = 0;
        //s_vif.cyc = 0;
        //s_vif.stb = 0;
        s_vif.data_out = 0;
        s_vif.ack = 0;
        s_vif.err = 0;
        s_vif.rty = 0;
        @(negedge s_vif.clk_i)
        `uvm_info(get_type_name(), "Reset done!", UVM_DEBUG)
      end
  endtask: drive_data
endclass: slave_driver
