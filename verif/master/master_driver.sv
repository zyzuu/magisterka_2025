// Class: master_driver
//
class master_driver extends uvm_driver#(base_transaction);
  `uvm_component_utils(master_driver)

  virtual base_if m_vif;
  string if_name;
  base_transaction m_base_transaction;

  function new(string name = "master_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction: build_phase

  function void set_vif(string if_name);
    if (!uvm_config_db#(virtual base_if)::get(null, "*", if_name, m_vif)) begin
      $display($sformatf("FATAL, %s, Could not get %s from factory", get_type_name(), if_name));
      $finish;
    end
  endfunction: set_vif

  task run_phase(uvm_phase phase);
    base_transaction m_base_transaction;

    forever begin
      seq_item_port.get_next_item(m_base_transaction);
      drive_data(m_base_transaction);
      seq_item_port.item_done();
      //$display($sformatf("%s, After item_done call!", get_type_name()));
    end
  endtask: run_phase

  task drive_data(base_transaction m_base_transaction);
      @(posedge m_vif.clk_i);
      if (!m_vif.rst_i) begin
          m_vif.addr = m_base_transaction.addr;
          m_vif.sel = m_base_transaction.addr[31:28];
          m_vif.cyc = 1;
          m_vif.stb = 1;
          m_vif.data_out = m_base_transaction.data_out;

        if (m_base_transaction.operation == READ) begin
          m_vif.we = 0; // Assert READ
        end
        else begin
          m_vif.we = 1; // Assert WRITE
        end

          @(posedge m_vif.clk_i);
          wait (m_vif.ack == 1);
          @(posedge m_vif.clk_i);

          m_vif.stb = 0;
          m_vif.cyc = 0;
      end
      else begin // Reset actions
        //$display($sformatf("%s, Entered reset state!",get_type_name()));

        m_vif.data_in = 0;
        m_vif.addr = 0;
        m_vif.sel = 0;
        m_vif.we = 0;
        m_vif.cyc = 0;
        m_vif.stb = 0;
        m_vif.data_out = 0;
        m_vif.ack = 0;
        m_vif.err = 0;
        m_vif.rty = 0;
        @(posedge m_vif.clk_i);
        @(negedge m_vif.clk_i);
        //$display($sformatf("%s Reset done!", get_type_name()));
      end
  endtask: drive_data
endclass: master_driver
