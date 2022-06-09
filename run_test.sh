#!/usr/bin/env bash

JSCODESHIFT=./node_modules/.bin/jscodeshift
OUTPUT_DIR=./tests/output

if ! [ -f ${JSCODESHIFT} ]; then
    npm install jscodeshift
fi

mkdir -p ${OUTPUT_DIR}

FILTER=$1

if [ "x${FILTER}" = "x-h" -o "x${FILTER}" = "x--help" ]; then
    echo "Usage: ./run_test.sh [FILTER]"
    echo
    echo "  FILTER: Substring match for the test path"
    echo
    exit
fi

PASSED=0
FAILED=0
SKIPPED=0

maybe_skip() {
    INPUT=$1

    if [ "x$FILTER" = "x" ]; then
        return 0
    fi

    if echo ${INPUT} | grep -q ${FILTER}; then
        return 0
    fi

    SKIPPED=$(echo "${SKIPPED} + 1" | bc)
    printf "\033[33;1;4m"
    echo "TEST-SKIP: ${INPUT}"
    printf "\033[0m"

    return 1
}

do_test() {
    RULE=$1
    INPUT=$2

    maybe_skip ${INPUT} || return

    ANS=$(echo ${INPUT} | sed -e 's/\.js$/\.ans.js/')
    TMPFILE=${OUTPUT_DIR}/$(basename ${INPUT})
    cp ${INPUT} ${TMPFILE}

    set -x
    ${JSCODESHIFT} -s -t ${RULE} ${TMPFILE}
    { set +x; } 2> /dev/null

    diff -u ${ANS} ${TMPFILE}
    RESULT=$?

    if [ ${RESULT} -eq 0 ]; then
        PASSED=$(echo "${PASSED} + 1" | bc)
        printf "\033[32;1;4m"
        echo "TEST-PASS: ${INPUT}"
        printf "\033[0m"
    else
        FAILED=$(echo "${PASSED} + 1" | bc)
        printf "\033[31;1;4m"
        echo "TEST-UNEXPECTED-FAIL: ${INPUT}"
        printf "\033[0m"
    fi
}

do_error_test() {
    RULE=$1
    INPUT=$2

    maybe_skip ${INPUT} || return

    ERROR=$(head -1 ${INPUT} | sed -e 's|^// ||')
    TMPFILE=${OUTPUT_DIR}/$(basename ${INPUT})
    OUTFILE=${TMPFILE}.out
    cp ${INPUT} ${TMPFILE}

    set -x
    ${JSCODESHIFT} -s -t ${RULE} ${TMPFILE} > ${OUTFILE}
    { set +x; } 2> /dev/null

    grep -q "${ERROR}" ${OUTFILE}
    RESULT=$?

    if [ ${RESULT} -eq 0 ]; then
        PASSED=$(echo "${PASSED} + 1" | bc)
        printf "\033[32;1;4m"
        echo "TEST-PASS: ${INPUT}"
        printf "\033[0m"
    else
        FAILED=$(echo "${PASSED} + 1" | bc)
        printf "\033[31;1;4m"
        echo "TEST-UNEXPECTED-FAIL: ${INPUT}"
        printf "\033[0m"
        echo "==== Expected ===="
        echo ${ERROR}
        echo "==== Got ===="
        cat ${OUTFILE}
    fi
}

# ---- tests: export ----

RULE=exported_symbols-to-declarations.js

# basic

do_test ${RULE} tests/export_var.js
do_test ${RULE} tests/export_let.js
do_test ${RULE} tests/export_const.js

do_test ${RULE} tests/export_destruct.js

do_test ${RULE} tests/export_function.js
do_test ${RULE} tests/export_class.js

# duplicate symbol inside block

do_test ${RULE} tests/export_dup.js

# comment handling

do_test ${RULE} tests/export_comment.js

# error

do_error_test ${RULE} tests/error_exported_symbols_no_symbols.js
do_error_test ${RULE} tests/error_this_exported_symbols.js
do_error_test ${RULE} tests/error_exported_symbols_dynamic.js
do_error_test ${RULE} tests/error_exported_symbols_with_other.js
do_error_test ${RULE} tests/error_exported_symbols_no_array.js
do_error_test ${RULE} tests/error_exported_symbols_no_literal.js
do_error_test ${RULE} tests/error_exported_symbols_no_string.js

do_error_test ${RULE} tests/error_export_with_other.js
do_error_test ${RULE} tests/error_export_with_other_export.js

do_error_test ${RULE} tests/error_missing_exported.js
do_error_test ${RULE} tests/error_missing_exported_multi.js

# ---- tests: import ----

RULE=import-to-import_esm.js

# basic import

do_test ${RULE} tests/import_top_level.js
do_test ${RULE} tests/import_block.js

do_test ${RULE} tests/import_cu_top_level.js
do_test ${RULE} tests/import_cu_block.js

# import namespace object

do_test ${RULE} tests/import_ns_top_level.js
do_test ${RULE} tests/import_ns_block.js

# import with alias

do_test ${RULE} tests/import_alias_top_level.js
do_test ${RULE} tests/import_alias_block.js

# lazy getter

do_test ${RULE} tests/import_lazy.js
do_test ${RULE} tests/import_lazy_xpcom.js

# lazy getters

do_test ${RULE} tests/import_lazy_multi.js

# ---- summary ----

echo ""
printf "\033[32;1;4m"
echo " Passed: ${PASSED}"
printf "\033[31;1;4m"
echo " Failed: ${FAILED}"
printf "\033[33;1;4m"
echo "Skipped: ${SKIPPED}"
printf "\033[0m"

if [ ${FAILED} -ne 0 ]; then
    exit 1
fi
