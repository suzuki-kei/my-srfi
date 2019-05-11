
GOSH = gosh -I ./src/main
TEST_DIR = ./src/test

test: \
	test-internals \
	test-srfi-1

test-internals:

	${GOSH} ${TEST_DIR}/my-srfi/test-my-srfi-internals.scm

test-srfi-1:
	${GOSH} ${TEST_DIR}/my-srfi/test-my-srfi-1.scm

