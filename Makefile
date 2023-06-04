

all: assertx plugin

ASSERTX=./assertx

# Build the extended compiler
assertx: assert-check.stanza
	stanza extend assert-check.stanza -o $(ASSERTX)

plugin: assert-check.stanza
	stanza compile-macros $< -o assertx.macros -optimize

TESTBIN=./run_tests

test: export __ASSERT_CHECK_TESTING = 1
test: assert-tests.stanza | assertx
	$(ASSERTX) compile-test $< -o $(TESTBIN)
	$(TESTBIN)

clean:
	rm -f $(ASSERTX)
	rm -f $(TESTBIN)

.PHONY: clean
