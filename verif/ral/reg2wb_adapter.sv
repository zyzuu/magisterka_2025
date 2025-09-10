class reg2wb_adapter extends uvm_reg_adapter;
  `uvm_object_utils(reg2wb_adapter)

  function new(string name="reg2wb_adapter");
    super.new(name);
    supports_byte_enable = 0;
    provides_responses = 0;
  endfunction : new

  // This function accepts a register item of type "uvm_reg_bus_op" and assigns
  // address, data and other required fields to the bus protocol sequence_item
  virtual function uvm_sequence_item reg2bus (const ref uvm_reg_bus_op rw);
    base_transaction m_base_transaction = base_transaction::type_id::create ("m_base_transaction");
    m_base_transaction.data_out = rw.data;
    m_base_transaction.addr  = rw.addr;
    m_base_transaction.we = 1;
    m_base_transaction.cyc = 1;
    m_base_transaction.stb = 1;
    `uvm_info ("adapter", $sformatf ("reg2bus addr=0x%0h data=0x%0h kind=%s", m_base_transaction.addr, m_base_transaction.data_in, rw.kind.name), UVM_LOW)
    return m_base_transaction;
  endfunction

  // This function accepts a bus sequence_item and assigns address/data fields to
  // the register item
  virtual function void bus2reg (uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    base_transaction m_base_transaction;

    // bus_item is a base class handle of type "uvm_sequence_item" and hence does not
    // contain addr, data properties in it. Hence bus_item has to be cast into bus_pkt
    if (! $cast (m_base_transaction, bus_item)) begin
      `uvm_fatal ("reg2apb_adapter", "Failed to cast bus_item to pkt")
    end

    rw.kind = m_base_transaction.we ? UVM_WRITE : UVM_READ;
    rw.addr = m_base_transaction.addr;
    rw.data = m_base_transaction.data_out;
    rw.status = UVM_IS_OK;
    `uvm_info ("adapter", $sformatf("bus2reg : addr=0x%0h data=0x%0h kind=%s status=%s", rw.addr, rw.data, rw.kind.name(), rw.status.name()), UVM_LOW)
  endfunction
endclass