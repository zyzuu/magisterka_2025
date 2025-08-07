class slave_monitor extends uvm_monitor;
  `uvm_component_utils(slave_monitor)

  virtual base_if s_vif;

  logic [31:0] memory [*];

  function new(string name = "slave_monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void set_vif(string if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "*", if_name, s_vif))begin
      $display($sformatf("FATAL, %s, Could not get %s from factory", get_type_name(), if_name));
      $finish;
    end
  endfunction: set_vif


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    forever begin
      base_transaction m_base_transaction = new();
      wait(s_vif.cyc == 1 && s_vif.stb == 1);
      m_base_transaction.addr = s_vif.addr;
      m_base_transaction.sel = s_vif.sel;
      m_base_transaction.we = s_vif.we;
      m_base_transaction.operation = operation_t'(s_vif.we);
      m_base_transaction.cyc = s_vif.cyc;
      m_base_transaction.stb = s_vif.stb;
      m_base_transaction.data_out = !s_vif.we ? s_vif.data_out : 0;
      m_base_transaction.ack = s_vif.ack;
      m_base_transaction.err = s_vif.err;
      m_base_transaction.rty = s_vif.rty;
      @(posedge s_vif.clk_i);
    end
  endtask: run_phase


endclass: slave_monitor
