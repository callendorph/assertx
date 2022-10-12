# Assert Macro for Stanza

This file contains the implementation of a stanza macro
for C-style assert checks. For example:

```
   val a = 1
   val b = 2
   assert( b > 0 )
   assert ( a > b, "A should always be greater than B")
```

This results ins:

```
$> ./assertx compile test.stanza -o testassert
$> ./testassert
FATAL ERROR: ASSERT: ($do greater? a b) = false
SYMBOLS: ["a" => 1 "b" => 2]
MSG: "A should always be greater than B"
  in core/print-stack-trace
    at core/core.stanza:330.14
  in core/print-stack-trace
    at core/core.stanza:336.2
  in core/fatal
    at core/core.stanza:383.2
  in mypkg/main
    at test.stanza:12.13
  in mypkg
    at test.stanza:16.0
```

## Build

You will need a working version of [stanza](http://lbstanza.org).
I suggest using version 0.17.26 or greater.

## Testing

You can run `make test` and this will run the unit test suite.

For testing there is an environment variable `__ASSERT_CHECK_TESTING` that must be set during compilation (not runtime) of the tests so that the assert macro won't call `fatal` during the test.