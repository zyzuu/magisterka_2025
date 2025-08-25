// Class: slave_driver
//
class slave_driver extends uvm_driver#(base_transaction);
  `uvm_component_utils(slave_driver)

  logic [31:0] memory [*];

  virtual base_if s_vif;
  string if_name;

  uvm_analysis_port #(base_transaction) driver_port;

  function new(string name = "slave_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void set_vif(string if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "uvm_test_top", if_name, s_vif))
    `uvm_fatal(get_type_name(), $sformatf("Could not get %s from factory", if_name))
  endfunction: set_vif

  task drive_init_reset();
      `uvm_info(get_type_name(), "Entered reset state!", UVM_DEBUG)
      s_vif.data_in = 0;
      s_vif.ack = 0;
      s_vif.err = 0;
      s_vif.rty = 0;
      @(posedge s_vif.clk_i);
      `uvm_info(get_type_name(), "Reset done!", UVM_DEBUG)
  endtask : drive_init_reset

  task run_phase(uvm_phase phase);
    while(s_vif.rst_i) drive_init_reset();
    forever begin
      drive_data();
      `uvm_info(get_type_name(), "After item_done call!", UVM_DEBUG);
    end
  endtask: run_phase


  task drive_data();
    wait(s_vif.cyc && s_vif.stb);
    @(posedge s_vif.clk_i);

    s_vif.ack = 1;
    s_vif.err = 0;
    s_vif.rty = 0;
    @(posedge s_vif.clk_i);

    if(s_vif.we == 0) begin
      //s_vif.data_out = !memory.exists(s_vif.addr) ? 32'b0 : memory[s_vif.addr];
      `uvm_info(get_type_name(), $sformatf("READ s_vif.addr: %h, s_vif.data_out: %h, s_vif.data_in: %h", s_vif.addr, s_vif.data_out, s_vif.data_in), UVM_DEBUG);
      s_vif.data_in = 'hCAFE_CAFE;
    end
    else begin
      //memory[s_vif.addr] = s_vif.data_out;
      `uvm_info(get_type_name(), $sformatf("WRITE s_vif.addr: %h, s_vif.data_out: %h, s_vif.data_in: %h", s_vif.addr, s_vif.data_out, s_vif.data_in), UVM_DEBUG);
    end
    @(posedge s_vif.clk_i);

    s_vif.ack = 0;
    @(posedge s_vif.clk_i);
  endtask: drive_data
endclass: slave_driver
