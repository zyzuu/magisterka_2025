class master_monitor extends uvm_monitor;
  `uvm_component_utils(master_monitor)

  virtual base_if m_vif;

  function new(string name = "master_monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void set_vif(string if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "*", if_name, m_vif)) begin
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
      wait(m_vif.cyc && m_vif.stb);
      m_base_transaction.data_out = m_vif.we ? m_vif.data_out : 0;
      m_base_transaction.addr = m_vif.addr;
      m_base_transaction.sel = m_vif.sel;
      m_base_transaction.we = m_vif.we;
      m_base_transaction.operation = operation_t'(m_vif.we);
      m_base_transaction.cyc = m_vif.cyc;
      m_base_transaction.stb = m_vif.stb;
      m_base_transaction.ack = m_vif.ack;
      m_base_transaction.err = m_vif.err;
      m_base_transaction.rty = m_vif.rty;
      @(posedge m_vif.clk_i);
    end
  endtask: run_phase


endclass: master_monitor
