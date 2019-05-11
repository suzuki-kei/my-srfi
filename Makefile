test: \
	test-internals \
	test-srfi-1

test-internals:
	gosh -I./src/main ./src/test/my-srfi/test-my-srfi-internals.scm

test-srfi-1:
	gosh -I./src/main ./src/test/my-srfi/test-my-srfi-1.scm

