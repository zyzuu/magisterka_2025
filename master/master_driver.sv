// Class: master_driver
//
class master_driver extends uvm_driver#(base_transaction);
    `uvm_component_utils(master_driver)

    // Parameters
    parameter int TRANSACTION_DELAY = 100; // unit: us

    // Virtual interface
    virtual base_if m_vif;

    function new(string name = "master_driver", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual base_if)::get(this, "", "base_if", m_vif))
        `uvm_fatal(get_type_name(), "Could not get m_vif from factory")
    endfunction: build_phase

    task run_phase(uvm_phase phase);
        base_transaction m_base_transaction;
        forever begin
            // Transaction begin
            seq_item_port.get_next_item(m_base_transaction); // This method blocks until a REQ sequence_item is available in the sequencer.
            `uvm_info(get_type_name(), "After get_next_item call!", UVM_DEBUG);
            // Pin wiggles
            drive_data(m_base_transaction);
            //m_vif.data_in = m_base_transaction.data_in;
            //m_vif.addr = m_base_transaction.addr;
            //m_vif.sel = m_base_transaction.sel;
            //m_vif.we = m_base_transaction.we;
            //m_vif.cyc = m_base_transaction.cyc;
            //m_vif.stb = m_base_transaction.stb;
            //m_vif.data_out = m_base_transaction.data_out;
            //m_vif.ack = m_base_transaction.ack;
            //m_vif.err = m_base_transaction.err;
            //m_vif.rty = m_base_transaction.rty;

            // Transaction complete
            seq_item_port.item_done();
            `uvm_info(get_type_name(), "After item_done call!", UVM_DEBUG);
        end
    endtask: run_phase

    task drive_data(base_transaction m_base_transaction);
        do begin
            wait (m_vif.clk_i)

            if (!m_vif.rst_i) begin
                // TODO: READ AND WRITE
              if (m_base_transaction.operation == 0) begin // SINGLE READ CYCLE
                    m_vif.addr <= m_base_transaction.addr;
                    m_vif.we <= 0; // Assert READ
                    m_vif.sel <= m_base_transaction.sel;
                    m_vif.cyc <= 1;
                    m_vif.stb <= 1;
                    @(posedge m_vif.clk);

                    wait (m_vif.ack == 1);
                    m_base_transaction.data_in <= m_vif.data_in;
                    m_vif.stb = ~m_vif.stb;
                    m_vif.cyc = ~m_vif.cyc;
                end
              if (m_base_transaction.operation == 1) begin // SINGLE WRITE CYCLE
                    m_vif.addr <= m_base_transaction.addr;
                    m_vif.we <= 1; // Assert WRITE
                    m_vif.sel <= m_base_transaction.sel;
                    m_vif.cyc <= 1;
                    m_vif.stb <= 1;
                    @(posedge m_vif.clk);

                    wait (m_vif.ack);
                    m_vif.data_out <= m_base_transaction.data_out;
                    m_vif.stb = ~m_vif.stb;
                    m_vif.cyc = ~m_vif.cyc;

                end
            end

            else begin // Reset actions
                `uvm_info(get_type_name(), "Entered reset state!", UVM_DEBUG)
                wait (m_vif.clk_i)

                m_vif.data_in <= 0;
                m_vif.addr <= 0;
                m_vif.sel <= 0;
                m_vif.we <= 0;
                m_vif.cyc <= 0;
                m_vif.stb <= 0;
                m_vif.data_out <= 0;
                m_vif.ack <= 0;
                m_vif.err <= 0;
                m_vif.rty <= 0;
                wait (m_vif.clk_i == 1);
                wait (m_vif.clk_i == 0); // @(negedge clk) substitution
                `uvm_info(get_type_name(), "Reset done!", UVM_LOW)
            end
        end
        while(!m_vif.rst_i);
    endtask: drive_data
endclass: master_driver
