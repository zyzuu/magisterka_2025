`uvm_analysis_imp_decl (_monitor)
`uvm_analysis_imp_decl (_driver)
class base_scoreboard extends uvm_scoreboard;
    `uvm_component_utils (base_scoreboard)

    uvm_analysis_imp_monitor #(base_transaction, base_scoreboard) ap_imp_monitor;
    uvm_analysis_imp_driver #(base_transaction, base_scoreboard) ap_imp_driver;

    base_transaction items_from_monitor [$];
    base_transaction items_from_driver [$];

    function new (string name = "base_scoreboard", uvm_component parent = null);
      super.new (name, parent);
    endfunction : new

    function void build_phase (uvm_phase phase);
      ap_imp_monitor = new("ap_imp_monitor", this);
      ap_imp_driver = new("ap_imp_driver", this);
      super.build_phase(phase);
    endfunction : build_phase

    virtual function void write_monitor (base_transaction monitored_data);
      base_transaction temp_transaction = base_transaction::type_id::create("temp_transaction");
      `uvm_info(get_type_name(), $sformatf("Monitored transaction arrived!"), UVM_DEBUG)
      if (uvm_top.get_report_verbosity_level() == UVM_DEBUG)
        monitored_data.print();

      temp_transaction.copy(monitored_data);
      items_from_monitor.push_front(temp_transaction);
    endfunction : write_monitor

    virtual function void write_driver (base_transaction drived_data);
      base_transaction temp_transaction = base_transaction::type_id::create("temp_transaction");
      `uvm_info(get_type_name(), $sformatf("Monitored transaction arrived!"), UVM_DEBUG)
      if (uvm_top.get_report_verbosity_level() == UVM_DEBUG)
        drived_data.print();

      temp_transaction.copy(drived_data);
      items_from_driver.push_front(temp_transaction);
    endfunction : write_driver

    function void check_phase(uvm_phase phase);
      if (items_from_driver.size() != items_from_monitor.size())
        `uvm_error(get_type_name(), $sformatf("Number of elements drove do not equal number of elements monitored, items_from_driver.size() = %d, items_from_monitor.size() = %d", items_from_driver.size(), items_from_monitor.size()))
      else
        foreach (items_from_driver[i]) begin
          if(items_from_driver[i].addr != items_from_monitor[i].addr)
            `uvm_error(get_type_name(), $sformatf("Mismatch, item from driver addr = %h, item from monitor addr = %h", items_from_driver[i].addr, items_from_monitor[i].addr))
          if(items_from_driver[i].we != items_from_monitor[i].we)
            `uvm_error(get_type_name(), $sformatf("Mismatch, item from driver we = %h, item from monitor we = %h", items_from_driver[i].we, items_from_monitor[i].we))
          if(items_from_driver[i].data_out != items_from_monitor[i].data_out && items_from_driver[i].data_in != items_from_monitor[i].data_in )
            `uvm_error(get_type_name(), $sformatf("Mismatch, item from driver data in = %h; out = %h, item from monitor data in = %h; out = %h", items_from_driver[i].data_in, items_from_driver[i].data_out, items_from_monitor[i].data_in, items_from_monitor[i].data_out))
        end
    endfunction : check_phase

endclass : base_scoreboard