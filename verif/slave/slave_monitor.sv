class slave_monitor extends uvm_monitor;
  `uvm_component_utils(slave_monitor)

  virtual base_if s_vif;

  logic [31:0] memory [*];

  uvm_analysis_port #(base_transaction) monitor_port;

  function new(string name = "slave_monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    monitor_port = new("monitor_port", this);

    if (!uvm_config_db#(virtual base_if)::get(this, "", "s_vif", s_vif))
      `uvm_fatal(get_type_name(), $sformatf("Could not get %p from factory", s_vif))
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    base_transaction m_base_transaction = new();
    forever begin
      wait(s_vif.cyc && s_vif.stb);
      m_base_transaction.addr = s_vif.addr;
      m_base_transaction.sel = s_vif.sel;
      m_base_transaction.we = s_vif.we;
      m_base_transaction.cyc = s_vif.cyc;
      m_base_transaction.stb = s_vif.stb;
      wait(s_vif.ack);
      @(posedge s_vif.clk_i);
      m_base_transaction.operation = operation_t'(s_vif.we);
      m_base_transaction.data_out = s_vif.we ? s_vif.data_out : 0;
      m_base_transaction.data_in = !s_vif.we ? s_vif.data_in : 0;
      m_base_transaction.ack = s_vif.ack;
      m_base_transaction.err = s_vif.err;
      m_base_transaction.rty = s_vif.rty;
      monitor_port.write(m_base_transaction);
      wait(~s_vif.cyc || ~s_vif.stb || ~s_vif.ack);
      @(posedge s_vif.clk_i);
    end
  endtask : run_phase


endclass : slave_monitor
