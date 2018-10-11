# HW4: conveniently organized deliverables (maybe?)

## Deliverable 1: Register structural diagrams

![Register diagrams](images/register_diagrams.jpg)

## Deliverable 2: `register32` module

Available [here](register.v). I ended up just copying the code from `register` because, with the magics of behavioral Verilog, it still works.

Tested [here](register.t.v). I tested that, if you write a value, it outputs a value with `wrenable` asserted, and then that, if `wrenable` is deasserted, sending a new value to write will do nothing.

## Deliverable 3: `register32zero` module

Also available [here](register.v) and also tested [here](register.t.v). I tested that, regardless of `wrenable`, with inputs, the output is all 0s.

## Deliverable 4: `mux32to1by1` module

Available [here](mux.v). This was really easy in behavioral Verilog.

## Deliverable 5: `mux32to1by32` module

Available [here](mux.v). I generated all the repetitive bits with Python, which was a lot easier. :)

Here is what I ran in an interpreter to generate the inputs:
```python
for i in range(32):
  print "input" + str(i) + ", ",
```

And the assign statements:
```python
for i in range(32):
  print "assign mux[" + str(i) + "] = input" + str(i) + ";"
```

Tested [here](mux.t.v). I tested that, for every address, the output is the addressth input. I chose to do this exhaustively because it's kind of easy, using Python, but in the future I might choose tests more selectively.

Here is how I generated random values for inputs:
```python
import random
inputs = 0
for i in range(32):
  a = bin(random.randint(0, 2**32))
  print "input" + str(i) + " = " + str(a)[2:] + ";"
```

And the tests:
```python
for i in range(32):
  print "// Test address " + str(i)
  print "address=" + str(i) + "; #20"
  print "if (out !== input" + str(i) + ") begin"
  print "  $display(\"Test address " + str(i) + " failed\");"
  print "  $display(\"Expected: %b\", input" + str(i) + ");"
  print "  $display(\"Actual:   %b\", out);"
  print "  dutpassed = 0;"
  print "end"
```

## Deliverable 6: Decoder

Take the example `a << b`. `<<` means left shift. We shift `a` to the left by `b` places and fill in the rest of the places with 0s.

In the case of `enable << address`, consider the possible cases of `enable`. When `enable` is `0`, `enable << address` will be 0. When `enable` is `1`, `enable << address` will be `1` followed by `address` `0`s. This means the decoder will set outputs `0` to `address - 1` as `0`, and output `address` to `1` (note the careful not-off-by-1 arithmetic here). Presumably, behavioral Verilog will make something smaller than 32 bits (as `enable << address` will often be) and left-fill/pad with `0`s, so outputs `address + 1` to `31` will all also be `0`.

Hooray, decoder.

I didn't test this because I trust the provided implementation.
