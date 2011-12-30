-- page 62 (pdf 102)
foo = let a = 1
      in let b = 2
         in a + b

-- we can shadow variables, though that is unadvisable
-- this will return ("foo", 1)
bar = let x = 1
      in ((let x = "foo" in x), x)

-- also inadvisable is shadowing argument names
-- :type quux :: t -> [Char]
-- the argument type is irrelevant and can thus be anything
quux a = let a = "foo"
         in a ++ "eek!"
