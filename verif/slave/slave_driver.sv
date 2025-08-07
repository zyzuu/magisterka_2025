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

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction: build_phase

  function void set_vif(string if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "*", if_name, s_vif))begin
      $display($sformatf("FATAL, %s, Could not get %s from factory", get_type_name(), if_name));
      $finish;
    end
  endfunction: set_vif

  task run_phase(uvm_phase phase);
    forever begin
      drive_data();
      //$display($sformatf("%s, After item_done call!",get_type_name()));
    end
  endtask: run_phase

  task drive_data();
      if (!s_vif.rst_i) begin
        wait(s_vif.cyc == 1 && s_vif.stb == 1);

        if(s_vif.we == 0) begin
          s_vif.data_out = !memory.exists(s_vif.addr) ? 32'b0 : memory[s_vif.addr];
          //$display($sformatf("%s, READ s_vif.addr: %h, s_vif.data_out: %h, s_vif.data_in: %h", get_type_name(), s_vif.addr, s_vif.data_out, s_vif.data_in));
        end
        else begin
          memory[s_vif.addr] = s_vif.data_out;
          //$display($sformatf("%s, WRITE s_vif.addr: %h, s_vif.data_out: %h, s_vif.data_in: %h", get_type_name(), s_vif.addr, s_vif.data_out, s_vif.data_in));
        end

        s_vif.ack = 1;
        s_vif.err = 0;
        s_vif.rty = 0;

        @(posedge s_vif.clk_i);
        @(negedge s_vif.clk_i);

        s_vif.ack = 0;
      end
      else begin // Reset actions
        //$display($sformatf("%s,Entered reset state!", get_type_name()));
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
        @(negedge s_vif.clk_i);
        //$display($sformatf("%s, Reset done!", get_type_name()));
      end
  endtask: drive_data
endclass: slave_driver