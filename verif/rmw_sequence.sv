class rmw_sequence extends base_sequence;
  `uvm_object_utils(rmw_sequence)

  function new(string name = "rmw_sequence");
    super.new(name);
  endfunction: new

  virtual task body();
    uvm_objection objection = new("objection");
    m_req = base_transaction::type_id::create("m_req");
    m_rsp = base_transaction::type_id::create("m_rsp");
      m_req.randomize() with {
        mode == MASTER_MODE;
        num_of_transactions == 2;
        addr == destination_address;
        cycle_type == RMW;
        we == READ;
      };
    objection.raise_objection(this);
    start_item(m_req);
    finish_item(m_req);
    get_response(m_rsp);
    m_req.data_out = m_rsp.data_in+'h1;
    m_req.we = WRITE;
    m_req.addr = destination_address;
    start_item(m_req);
    finish_item(m_req);
    objection.drop_objection(this);
  endtask: body
endclass: rmw_sequence
