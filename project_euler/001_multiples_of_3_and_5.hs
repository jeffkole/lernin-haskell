-- If we list all the natural numbers below 10 that are multiples of 3 or 5,
-- we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
-- Find the sum of all the multiples of 3 or 5 below 1000.

import System

-- Returns true if x is a multiple of y
isMultiple :: Integral a => a -> a -> Bool
isMultiple x 0 = False
isMultiple x y = x `mod` y == 0

isMultiple' :: Integral a => a -> Bool
isMultiple' x = isMultiple x 3 || isMultiple x 5

sumMultiples :: Integral a => [a] -> a
sumMultiples xs = sum (filter isMultiple' xs)

main = do
    (n:ns) <- getArgs
    let max = read n
    putStrLn ("The sum of all multiples of 3 or 5 below " ++ n ++ " is " ++
        (show $ sumMultiples [1..(max-1)]))
