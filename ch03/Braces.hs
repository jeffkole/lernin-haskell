-- page 66 (pdf 106)
-- The offside rule can be replaced with braces,
-- what every programmer hates these days.
-- These are all the same.
bar = let a = 1
          b = 2
          c = 3
      in a + b + c

foo = let { a = 1; b = 2;
        c = 3 }
      in a + b + c

baz =
    let a = 1
        b = 2
        c = 3
    in a + b + c

fuz =
    let
        a = 1
        b = 2
        c = 3
    in a + b + c
