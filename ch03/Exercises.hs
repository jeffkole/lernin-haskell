-- Exercises
-- page 69 (pdf 109)

-- 1. Write a function that computes the number of elements in a list.
numElements :: [a] -> Int
numElements []     = 0
numElements (x:xs) = 1 + numElements xs

-- 3. Write a function that computes the mean of a list.
mean :: (Fractional a) => [a] -> a
mean as = sum as / fromIntegral (length as)

-- The hard thing with this one was specifying the correct type signature.
-- I originally had (Num a) => [a] -> Double, but that did not work.
-- I had to load the function without the signature and have GHCI tell
-- me what an appropriate type signature would be.


-- 4. Write a function that turns a list into a palindrome.
palindromize :: [a] -> [a]
palindromize xs = makePalindrome xs xs
    -- makePalindrome: accumulator -> nextlist
    where makePalindrome [] [] = []
          makePalindrome xs [] = xs
          makePalindrome xs ys = makePalindrome (xs ++ [last ys]) (init ys)

-- 5. Write a function that determines whether its input list is a palindrome.
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome []       = False
isPalindrome (x:[])   = True
isPalindrome (x:y:[]) = x == y
isPalindrome (x:xs)   | x == (last xs) = isPalindrome (init xs)
                      | otherwise      = False
