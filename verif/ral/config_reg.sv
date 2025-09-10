class config_reg extends uvm_reg;
  `uvm_object_utils(config_reg)
  rand uvm_reg_field  reserved;
  rand uvm_reg_field  m7_priority;
  rand uvm_reg_field  m6_priority;
  rand uvm_reg_field  m5_priority;
  rand uvm_reg_field  m4_priority;
  rand uvm_reg_field  m3_priority;
  rand uvm_reg_field  m2_priority;
  rand uvm_reg_field  m1_priority;
  rand uvm_reg_field  m0_priority;

  function new(string name = "config_reg");
    super.new(name, 32/*size*/, UVM_NO_COVERAGE);
  endfunction

  virtual function void build ();
    this.m0_priority = uvm_reg_field::type_id::create ("m0_priority");
    this.m1_priority = uvm_reg_field::type_id::create ("m1_priority");
    this.m2_priority = uvm_reg_field::type_id::create ("m2_priority");
    this.m3_priority = uvm_reg_field::type_id::create ("m3_priority");
    this.m4_priority = uvm_reg_field::type_id::create ("m4_priority");
    this.m5_priority = uvm_reg_field::type_id::create ("m5_priority");
    this.m6_priority = uvm_reg_field::type_id::create ("m6_priority");
    this.m7_priority = uvm_reg_field::type_id::create ("m7_priority");
    this.reserved    = uvm_reg_field::type_id::create ("reserved");
    //0 -> Lowest priority; 3 -> Highest priority
    this.m0_priority.configure (.parent(this), .size(2), .lsb_pos(0), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.m1_priority.configure (.parent(this), .size(2), .lsb_pos(2), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.m2_priority.configure (.parent(this), .size(2), .lsb_pos(4), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.m3_priority.configure (.parent(this), .size(2), .lsb_pos(6), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.m4_priority.configure (.parent(this), .size(2), .lsb_pos(8), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.m5_priority.configure (.parent(this), .size(2), .lsb_pos(10), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.m6_priority.configure (.parent(this), .size(2), .lsb_pos(12), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.m7_priority.configure (.parent(this), .size(2), .lsb_pos(14), .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1), .is_rand(1), .individually_accessible(1));
    this.reserved.configure (.parent(this), .size(2), .lsb_pos(16), .access("RO"), .volatile(0), .reset(1'h0), .has_reset(0), .is_rand(0), .individually_accessible(0));
  endfunction
endclass