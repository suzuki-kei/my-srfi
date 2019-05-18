
GOSH = gosh -I ./src/main -I ./src/test
TEST_DIR = ./src/test

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

