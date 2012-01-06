Progress (ie, stopping points)
==============================
 * Chapter 3, page 70 (pdf 110): Exercises (2012/01/02)
 * Chapter 3, page 69 (pdf 109): Exercises (2011/12/29)
 * Chapter 3, page 62 (pdf version page 102): Shadowing (2011/12/28)

Lernins
=======
Chapter 2 -- 2011/12/28
-----------------------
The exercise was to write a function that returns the element before the last, similar to how `last` returns the last element of a list.  I ended up implementing the function five different ways, using different concepts like guards, pattern matching, and recursion.  The two I like best are

```
lastButOne :: [a] -> Maybe a
lastButOne [] = Nothing
lastButOne xs
    | null (tail xs) = Nothing
    | otherwise      = Just (head (drop (length xs - 2) xs))
```

and

```
lastButOne:: [a] -> a
lastButOne []       = error "Not enough elements"
lastButOne (x:_:[]) = x
lastButOne xs       = lastButOne (tail xs)
```

The first uses guards as well as pattern matching, and the second uses an example of the List constructor (:).

Chapter 3 - 2011/12/28 - 2012/01/02
-----------------------------------
### Types ###
Learned about types.  In the following example, `BookInfo` is a type constructor and `Book` is a value constructor.  The type names after `Book` represent the fields of the type.

```
data BookInfo = Book Int String [String]
```

Synonyms can be declared using the `type` keyword.  In the following, `CustomerID` is treated exactly like an `Int`.

```
type CustomerID = Int
```

Algebraic data types allow for one of several value constructors.  This is similar to class inheritance in OO languages (though I'm sure someone will argue with me on that comparison).

```
data Colors = Red
            | Orange
            | Yellow
            | Green
            | Blue
            | Indigo
            | Violet
```

And finally, record syntax allows you to declare types and their access functions in one go:

```
data Customer = Customer {
    customerID :: CustomerID,
    customerName :: String,
    customerAddress :: [String]
}

customer = Customer 1 "Jeff" ["1 Main St", "SF"]
customer' = Customer { customerID = 1, customerName = "Jeff", customerAddress = ["1 Main St", "SF"] }
```

### Numeric Types ###
One of the exercises involved writing a function that computes the mean of a list.  Originally I wrote the function signature as

```
mean :: (Num a) => [a] -> Double
```

Figuring that I could take any list of numbers and return a `Double` as its mean.  In the end I needed to write the function without a signature and ask `ghci` what the correct signature is.  Here are some tidbits to help figure it out:

```
mean as = sum as / fromIntegral (length as)

fromIntegral :: (Num b, Integral a) => a -> b
sum :: Num a => [a] -> a
length :: [a] -> Int
(/) :: Fractional a => a -> a -> a
```

So the function divides a `Num` by a `Num`, but the `(/)` operator requires two `Fractional`s and returns a `Fractional`, and since `Fractional` is a `Num` (is it a derivation of?), the correct signature should be

```
mean :: Fractional a => [a] -> a
```
