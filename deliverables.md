# HW4: conveniently organized deliverables (maybe?)

## Deliverable 1: Register structural diagrams

![Register diagrams](images/register_diagrams.jpg)

## Deliverable 2: `register32` module

Available [here](register.v). I tried using a generate block to make a bunch of the `register` module provided, but I couldn't figure out how to make that work with output `q` still being a `reg`. I ended up just copying the code from `register` because, with the magics of behavioral Verilog, it still works (I think). I'll probably ask for help before it's due.

## Deliverable 3: `register32zero` module

Also available [here](register.v). Like for `register32`, I had a hard time making this work with `q` still being a `reg`. I ended up putting it in an `always` block that's always true, which might loop forever. Not sure if it'll work. I'll probably ask for help before it's due.

## Deliverable 4: `mux32to1by1` module

Available [here](mux.v). This was really easy in behavioral Verilog.

## Deliverable 5: `mux32to1by32` module

Available [here](mux.v). I generated all the repetitive bits with Python, which was a lot easier. :)

## Deliverable 6: Decoder

Take the example `a << b`. `<<` means left shift. We shift `a` to the left by `b` places and fill in the rest of the places with 0s.

In the case of `enable << address`, consider the possible cases of `enable`. When `enable` is `0`, `enable << address` will be 0. When `enable` is `1`, `enable << address` will be `1` followed by `address` `0`s. This means the decoder will set outputs `0` to `address - 1` as `0`, and output `address` to `1` (note the careful not-off-by-1 arithmetic here). Presumably, behavioral Verilog will make something smaller than 32 bits (as `enable << address` will often be) and left-fill/pad with `0`s, so outputs `address + 1` to `31` will all also be `0`. 

Hooray, decoder.
