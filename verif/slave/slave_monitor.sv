class slave_monitor extends uvm_monitor;
  `uvm_component_utils(slave_monitor)

  // Virtual interface
  virtual base_if s_vif;

  // Analysis port
  uvm_analysis_port#(base_transaction) ap;
  logic [31:0] memory [1023:0];

  function new(string name = "slave_monitor", uvm_component parent=null);
  super.new(name, parent);
  ap = new("ap", this);
  endfunction: new

  function void set_vif(string if_name);
    $display("S_MONITOR set_vif() | if_name: %s", if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "uvm_test_top", if_name, s_vif))
    `uvm_fatal(get_type_name(), $sformatf("Could not get %s from factory", if_name))
  endfunction: set_vif


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    base_transaction m_base_transaction = new();
    forever begin
      @(posedge s_vif.clk_i);
      m_base_transaction.data_in <= s_vif.we ? s_vif.data_in : 0;
      m_base_transaction.addr <= s_vif.addr;
      m_base_transaction.sel <= s_vif.sel;
      m_base_transaction.we <= s_vif.we;
      m_base_transaction.operation <= s_vif.we;
      m_base_transaction.cyc <= s_vif.cyc;
      m_base_transaction.stb <= s_vif.stb;
      m_base_transaction.data_out <= !s_vif.we ? s_vif.data_out : 0;
      m_base_transaction.ack <= s_vif.ack;
      m_base_transaction.err <= s_vif.err;
      m_base_transaction.rty <= s_vif.rty;
      if(s_vif.cyc == 1 && s_vif.stb == 1 && s_vif.we == 1) begin
          memory[s_vif.addr] <= s_vif.data_in;
          s_vif.ack <= 1;
          s_vif.err <= 0;
          s_vif.rty <= 0;
          $display("S_MONITOR WRITE OPERATION | item: %p", m_base_transaction);
          @(posedge s_vif.clk_i);
          s_vif.ack <= 0;
      end
      if(s_vif.cyc == 1 && s_vif.stb == 1 && s_vif.we == 0) begin // SINGLE READ CYCLE
          s_vif.ack <= 1;
          s_vif.data_out <= memory[s_vif.addr];
          $display("S_MONITOR READ OPERATION | item: %p", m_base_transaction);
          @(posedge s_vif.clk_i);
          s_vif.ack <= 0;

      end
      //ap.write(m_base_transaction);
      $display("S_MONITOR run_phase() | item: %p", m_base_transaction);
    end
  endtask: run_phase


endclass: slave_monitor
