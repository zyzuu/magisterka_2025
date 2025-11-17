#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

VERIF_DIR="verif"
DESIGN_DIR="wb_conmax/rtl/verilog/"
DESIGN_SRCS="wb_conmax/rtl/verilog/*.v"
QUESTA_HOME="/eda/siemens/questasim_2023.4/questasim"
VCS_HOME="/eda/synopsys/2023-24/RHELx86/VCS_2023.12/etc/"

VERIF_SRCS_MASTER_HOME="${VERIF_DIR}/master"
VERIF_SRCS_SLAVE_HOME="${VERIF_DIR}/slave"
VERIF_SRCS_RAL_HOME="${VERIF_DIR}/ral"
VERIF_SRCS_TESTS_HOME="${VERIF_DIR}/tests"
VERIF_SRCS_SEQ_HOME="${VERIF_DIR}/sequences"
VERIF_SRCS_SHARE_HOME="${VERIF_DIR}/share"
VERIF_SRCS_TOP_HOME="${VERIF_DIR}/top"
VERIF_SRCS_ENV_HOME="${VERIF_DIR}/env"

# Build the verification source file list (space-separated string)
VERIF_SRCS=""
VERIF_SRCS+=" ${VERIF_SRCS_SHARE_HOME}/base_if.sv"
VERIF_SRCS+=" ${VERIF_SRCS_SHARE_HOME}/share_pkg.sv"
VERIF_SRCS+=" ${VERIF_SRCS_SEQ_HOME}/seq_pkg.sv"
VERIF_SRCS+=" ${VERIF_SRCS_RAL_HOME}/ral_pkg.sv"
VERIF_SRCS+=" ${VERIF_SRCS_MASTER_HOME}/master_pkg.sv"
VERIF_SRCS+=" ${VERIF_SRCS_SLAVE_HOME}/slave_pkg.sv"
VERIF_SRCS+=" ${VERIF_SRCS_ENV_HOME}/env_pkg.sv"
VERIF_SRCS+=" ${VERIF_SRCS_TESTS_HOME}/tests_pkg.sv"
VERIF_SRCS+=" ${VERIF_SRCS_TOP_HOME}/top.sv"

SYNOPSYS_ENV=". /eda/synopsys/scripts/add-synopsys-FEV-23-all"

SEED="${SEED:-1}"
TEST="${TEST:-base_test}"

GUI_P=""
GUI_VCS=""
if [ $1 == "GUI" ]; then
    GUI_VCS="-gui"
fi

DEBUG_CMD=""
if [ "$DEBUG" == "1" ]; then
    DEBUG_CMD="+UVM_VERBOSITY=UVM_DEBUG +UVM_CONFIG_DB_TRACE +UVM_PHASE_TRACE"
fi

$SYNOPSYS_ENV
    vcs -kdb -debug_access+all -sverilog -ntb_opts uvm-1.2 \
        -timescale=1ns/1ns -Xkeyopt=rtopt -Xkeyopt=mvu +rad \
        +incdir+"${VCS_HOME}/uvm-1.2" \
        +incdir+"${VERIF_SRCS_SHARE_HOME}" \
        +incdir+"${VERIF_SRCS_TESTS_HOME}" \
        +incdir+"${VERIF_SRCS_SEQ_HOME}" \
        +incdir+"${VERIF_SRCS_ENV_HOME}" \
        +incdir+"${DESIGN_DIR}" \
        +incdir+"${VERIF_DIR}" \
        +incdir+"${VERIF_SRCS_SLAVE_HOME}" \
        +incdir+"${VERIF_SRCS_MASTER_HOME}" \
        +incdir+"${VERIF_SRCS_RAL_HOME}" \
        $DESIGN_SRCS $VERIF_SRCS -cg_coverage_control=1

    ./simv +UVM_TESTNAME=$TEST +ntb_random_seed "$SEED" "$GUI_VCS" -l "vcs_${SEED}.log" \
        -reportstats -cg_coverage_control=1