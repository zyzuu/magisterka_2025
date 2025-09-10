class block_sequence extends base_sequence;
  `uvm_object_utils(block_sequence)

  function new(string name = "block_sequence");
    super.new(name);
  endfunction: new

  virtual task body();
    m_req = base_transaction::type_id::create("m_req");
    m_rsp = base_transaction::type_id::create("m_rsp");
      m_req.randomize() with {
        mode == MASTER_MODE;
        num_of_transactions == number_of_transactions;
        addr == destination_address;
        cycle_type == BLOCK;
      };
    for (int i=0; i<number_of_transactions; ++i) begin
    start_item(m_req);
      m_req.addr += 'hF;
      m_req.data_out += 'h1;
    finish_item(m_req);
    get_response(m_rsp);
    end
  endtask: body
endclass: block_sequence
