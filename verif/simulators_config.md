# Xilinx xsim
## xvlog
--uvm_version 1.2
--log xvlog_$(SEED).log
## xelab
--O3 - Enable advance optimizations
--debug off - turn off all debugging
abilities
--log xelab_$(SEED).log
## xsim
--sv_seed
--log xsim_$(SEED).log
-R - Run untill $finish

# Siemens questa
## vlog
-L uvm-1.2
-sv
## vopt
-O5 - optimization max
-noincr
-nodebug
## vsim
-log_file
-stats=perf
-sv_seed
-uvmcontrol=none

# Aldec riviera
## vlog
-O3
-nodebug
## vsim
-O5

# Cadence xcelium
## xrun -compile
-sv
-hlmdebug off
-plusperf
-newperf
## xrun -elaborate
-hlmdebug off
-plusperf
-newperf
-sv
## xrun -R
-sv
-hlmdebug off
-plusperf
-newperf
-perfstats

# Synopsys VCS
## vcs
-sverilog
-Xkeyopt=rtopt
-Xkeyopt=mvu
+rad
## simv
