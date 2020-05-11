
.DEFAULT_GOAL := help

GOSH = gosh -I ./src/main -I ./src/test
TEST_DIR = ./src/test

help:
	@cat ${MAKEFILE_LIST} | grep -oE '^[0-9a-zA-Z_-]+:' | sed 's/://' | sort

test: \
	test-my-srfi-internals \
	test-srfi-1 \
	test-my-srfi-1

test-my-srfi-internals:
	${GOSH} ${TEST_DIR}/my-srfi/test-my-srfi-internals.scm

test-srfi-1:
	${GOSH} ${TEST_DIR}/my-srfi/test-srfi-1.scm

test-my-srfi-1:
	${GOSH} ${TEST_DIR}/my-srfi/test-my-srfi-1.scm

