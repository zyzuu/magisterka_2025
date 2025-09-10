class config_block extends uvm_reg_block;
  `uvm_object_utils(config_block)
  rand config_reg config_reg_s0;
  rand config_reg config_reg_s1;
  rand config_reg config_reg_s2;
  rand config_reg config_reg_s3;
  rand config_reg config_reg_s4;
  rand config_reg config_reg_s5;
  rand config_reg config_reg_s6;
  rand config_reg config_reg_s7;
  rand config_reg config_reg_s8;
  rand config_reg config_reg_s9;
  rand config_reg config_reg_s10;
  rand config_reg config_reg_s11;
  rand config_reg config_reg_s12;
  rand config_reg config_reg_s13;
  rand config_reg config_reg_s14;
  rand config_reg config_reg_s15;

  uvm_reg_map reg_map;

  function new(string name = "config_block");
    super.new(name, UVM_NO_COVERAGE);
  endfunction : new

  virtual function void build ();
    reg_map = create_map (.name("reg_map"), .base_addr(32'hff00_0000), .n_bytes(4), .endian(UVM_LITTLE_ENDIAN));
    config_reg_s0 = config_reg::type_id::create ("config_reg_s0", , get_full_name());
    config_reg_s1 = config_reg::type_id::create ("config_reg_s1", , get_full_name());
    config_reg_s2 = config_reg::type_id::create ("config_reg_s2", , get_full_name());
    config_reg_s3 = config_reg::type_id::create ("config_reg_s3", , get_full_name());
    config_reg_s4 = config_reg::type_id::create ("config_reg_s4", , get_full_name());
    config_reg_s5 = config_reg::type_id::create ("config_reg_s5", , get_full_name());
    config_reg_s6 = config_reg::type_id::create ("config_reg_s6", , get_full_name());
    config_reg_s7 = config_reg::type_id::create ("config_reg_s7", , get_full_name());
    config_reg_s8 = config_reg::type_id::create ("config_reg_s8", , get_full_name());
    config_reg_s9 = config_reg::type_id::create ("config_reg_s9", , get_full_name());
    config_reg_s10 = config_reg::type_id::create ("config_reg_s10", , get_full_name());
    config_reg_s11 = config_reg::type_id::create ("config_reg_s11", , get_full_name());
    config_reg_s12 = config_reg::type_id::create ("config_reg_s12", , get_full_name());
    config_reg_s13 = config_reg::type_id::create ("config_reg_s13", , get_full_name());
    config_reg_s14 = config_reg::type_id::create ("config_reg_s14", , get_full_name());
    config_reg_s15 = config_reg::type_id::create ("config_reg_s15", , get_full_name());

    config_reg_s0.configure (this);
    config_reg_s1.configure (this);
    config_reg_s2.configure (this);
    config_reg_s3.configure (this);
    config_reg_s4.configure (this);
    config_reg_s5.configure (this);
    config_reg_s6.configure (this);
    config_reg_s7.configure (this);
    config_reg_s8.configure (this);
    config_reg_s9.configure (this);
    config_reg_s10.configure (this);
    config_reg_s11.configure (this);
    config_reg_s12.configure (this);
    config_reg_s13.configure (this);
    config_reg_s14.configure (this);
    config_reg_s15.configure (this);

    config_reg_s0.build();
    config_reg_s1.build();
    config_reg_s2.build();
    config_reg_s3.build();
    config_reg_s4.build();
    config_reg_s5.build();
    config_reg_s6.build();
    config_reg_s7.build();
    config_reg_s8.build();
    config_reg_s9.build();
    config_reg_s10.build();
    config_reg_s11.build();
    config_reg_s12.build();
    config_reg_s13.build();
    config_reg_s14.build();
    config_reg_s15.build();

    reg_map.add_reg(.rg(config_reg_s0), .offset('h0), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s1), .offset('h4), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s2), .offset('h8), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s3), .offset('hc), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s4), .offset('h10), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s5), .offset('h14), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s6), .offset('h18), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s7), .offset('h1c), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s8), .offset('h20), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s9), .offset('h24), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s10), .offset('h28), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s11), .offset('h2c), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s12), .offset('h30), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s13), .offset('h34), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s14), .offset('h38), .rights("RW"));
    reg_map.add_reg(.rg(config_reg_s15), .offset('h3c), .rights("RW"));

    lock_model();
  endfunction : build
endclass : config_block