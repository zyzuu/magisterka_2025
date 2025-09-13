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
    if (rw.addr[31:24] == 'hff) begin
      base_transaction m_base_transaction = base_transaction::type_id::create ("m_base_transaction");
      m_base_transaction.data_out = rw.data;
      m_base_transaction.addr = rw.addr;
      m_base_transaction.we = 1;
      m_base_transaction.cyc = 1;
      m_base_transaction.stb = 1;
      `uvm_info (get_type_name(), $sformatf ("reg2bus addr=0x%0h data=0x%0h kind=%s", m_base_transaction.addr, m_base_transaction.data_in, rw.kind.name), UVM_DEBUG)
      return m_base_transaction;
    end
  endfunction

  virtual function void bus2reg (uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    base_transaction m_base_transaction;
    if (! $cast (m_base_transaction, bus_item)) begin
      `uvm_fatal (get_type_name(), "Failed to cast bus_item to m_base_transaction")
    end
    if (m_base_transaction.addr[31:24] == 'hff) begin
      rw.kind = m_base_transaction.we ? UVM_WRITE : UVM_READ;
      rw.addr = m_base_transaction.addr;
      rw.data = m_base_transaction.data_in;
      rw.status = UVM_IS_OK;
      `uvm_info (get_type_name(), $sformatf("bus2reg : addr=0x%0h data=0x%0h kind=%s status=%s", rw.addr, rw.data, rw.kind.name(), rw.status.name()), UVM_DEBUG)
    end
  endfunction
endclass