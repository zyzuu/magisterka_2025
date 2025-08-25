// Class: master_driver
//
class master_driver extends uvm_driver#(base_transaction);
  `uvm_component_utils(master_driver)

  virtual base_if m_vif;
  string if_name;

  base_transaction m_base_transaction;
  int transaction_counter = 0;

  bit insert_wait_state = 0;
  int wait_state_duration = 0; // clock cycles

  uvm_analysis_port #(base_transaction) driver_port;

  function new(string name = "master_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    driver_port = new("driver_port", this);

    if (!uvm_config_db#(virtual base_if)::get(this, "", "m_vif", m_vif))
      `uvm_fatal(get_type_name(), $sformatf("Could not get %p from factory", m_vif))

    uvm_config_db#(bit)::get(this,"","insert_wait_state", insert_wait_state);
    uvm_config_db#(int)::get(this,"","wait_state_duration", wait_state_duration);
  endfunction : build_phase

  task run_phase(uvm_phase phase);
    base_transaction m_base_transaction;
    while(m_vif.rst_i) drive_init_reset();

    forever begin
      seq_item_port.get_next_item(m_base_transaction);
      drive_data(m_base_transaction);
      seq_item_port.item_done(m_base_transaction);
      `uvm_info(get_type_name(), "After item_done call!", UVM_DEBUG);
    end
  endtask : run_phase

  task drive_init_reset();
      `uvm_info(get_type_name(), "Entered reset state!", UVM_DEBUG)
      m_vif.addr = 0;
      m_vif.sel = 0;
      m_vif.we = 0;
      m_vif.cyc = 0;
      m_vif.stb = 0;
      m_vif.data_out = 0;
      @(posedge m_vif.clk_i);
      `uvm_info(get_type_name(), "Reset done!", UVM_DEBUG)
  endtask : drive_init_reset

  task drive_data(base_transaction m_base_transaction);
      transaction_counter++;
      m_vif.addr = m_base_transaction.addr;
      m_vif.sel = m_base_transaction.sel;
      m_vif.cyc = m_base_transaction.cyc;
      m_vif.stb = m_base_transaction.stb;
      m_vif.we = m_base_transaction.we;

      @(posedge m_vif.clk_i);
      wait (m_vif.ack == 1);

      if (m_base_transaction.we)
        m_vif.data_out = m_base_transaction.data_out;
      else
        m_base_transaction.data_in = m_vif.data_in;

      m_base_transaction.ack = m_vif.ack;
      @(posedge m_vif.clk_i);

      if (insert_wait_state) begin
        m_vif.stb = 0;
        repeat(wait_state_duration)
          @(posedge m_vif.clk_i);
      end


      if (m_base_transaction.cycle_type == SINGLE || transaction_counter == m_base_transaction.num_of_transactions) begin
        m_vif.stb = 0;
        m_vif.cyc = 0;
        transaction_counter = 0;
      end
      driver_port.write(m_base_transaction);
      @(posedge m_vif.clk_i);
  endtask : drive_data
endclass : master_driver
