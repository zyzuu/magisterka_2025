class master_monitor extends uvm_monitor;
  `uvm_component_utils(master_monitor)

  virtual base_if m_vif;

  uvm_analysis_port #(base_transaction) monitor_port;

  function new(string name = "master_monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    monitor_port = new("monitor_port", this);

    if (!uvm_config_db#(virtual base_if)::get(this, "", "m_vif", m_vif))
      `uvm_fatal(get_type_name(), $sformatf("Could not get %p from factory", m_vif))
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    base_transaction m_base_transaction = new();
    forever begin
      wait(m_vif.cyc && m_vif.stb);
      m_base_transaction.sel = m_vif.sel;
      m_base_transaction.we = m_vif.we;
      m_base_transaction.cyc = m_vif.cyc;
      m_base_transaction.stb = m_vif.stb;
      wait (m_vif.ack == 1);
      @(posedge m_vif.clk_i);
      m_base_transaction.addr = m_vif.addr;
      m_base_transaction.operation = operation_t'(m_vif.we);
      m_base_transaction.data_out = m_vif.we ? m_vif.data_out : 0;
      m_base_transaction.data_in = !m_vif.we ? m_vif.data_in : 0;
      m_base_transaction.ack = m_vif.ack;
      m_base_transaction.err = m_vif.err;
      m_base_transaction.rty = m_vif.rty;

      if (m_base_transaction.addr[31:24] != 'hFF)
        monitor_port.write(m_base_transaction);

      wait(~m_vif.cyc || ~m_vif.stb || ~m_vif.ack);
      @(posedge m_vif.clk_i);
    end
  endtask : run_phase


endclass : master_monitor
