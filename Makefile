
.DEFAULT_GOAL := help

# テストコードのルートディレクトリ.
TEST_DIR = ./src/test

# gosh コマンド (デフォルトパラメータを含む).
GOSH = gosh -I ./src/main -I ./src/test

#
# ルール一覧を表示する.
#
help:
	@cat ${MAKEFILE_LIST} | grep -oE '^[0-9a-zA-Z_-]+:' | sed 's/://' | sort

#
# 全てのテストを実行する.
#
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

