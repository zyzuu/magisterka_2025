`uvm_analysis_imp_decl (_arbiter_monitor)
class arbiter_scoreboard extends uvm_scoreboard;
    `uvm_component_utils (arbiter_scoreboard)

    uvm_analysis_imp_monitor #(base_transaction, arbiter_scoreboard) ap_imp_arbiter_monitor;

    base_transaction items_from_monitor [$];
    bit [1:0] prios [int];

    base_transaction prev_transaction;

    covergroup cg_arbiter with function sample (int master_origin);
      coverpoint master_origin {
        bins masters[8] = {[0:7]};
        illegal_bins other = {[8:$]};
      }
    endgroup : cg_arbiter

    function new (string name = "arbiter_scoreboard", uvm_component parent = null);
      super.new (name, parent);
      cg_arbiter = new();
    endfunction : new

    function void build_phase (uvm_phase phase);
      ap_imp_arbiter_monitor = new("ap_imp_arbiter_monitor", this);
      prev_transaction = base_transaction::type_id::create("prev_transaction");
    endfunction : build_phase

    virtual function void write_monitor (base_transaction monitored_data);
      base_transaction temp_transaction = base_transaction::type_id::create("temp_transaction");
      `uvm_info(get_type_name(), $sformatf("Monitored transaction arrived!"), UVM_DEBUG)
      if (uvm_top.get_report_verbosity_level() == UVM_DEBUG)
        monitored_data.print();

      temp_transaction.copy(monitored_data);
      items_from_monitor.push_front(temp_transaction);
      if (items_from_monitor.size() > 1) begin
        if (prios[temp_transaction.addr[3:0]] > prios[prev_transaction.addr[3:0]])
          `uvm_error(get_type_name(), $sformatf("Item with greater priority should be first! Current item priority: %d, Previous item priority: %d", prios[temp_transaction.addr[3:0]], prios[prev_transaction.addr[3:0]]))
        else if ((prios[temp_transaction.addr[3:0]] == prios[prev_transaction.addr[3:0]]) && (temp_transaction.addr[3:0] < prev_transaction.addr[3:0]))
          `uvm_error(get_type_name(), $sformatf("When priorities are equal item with origin of lower value should be first! Current item priority: %d, Previous item priority: %d", temp_transaction.addr[3:0], prev_transaction.addr[3:0]))
      end
      cg_arbiter.sample(int'(temp_transaction.addr[3:0]));
      prev_transaction.copy(temp_transaction);
    endfunction : write_monitor
endclass : arbiter_scoreboard