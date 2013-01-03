-- If we list all the natural numbers below 10 that are multiples of 3 or 5,
-- we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
-- Find the sum of all the multiples of 3 or 5 below 1000.

import System

-- Returns true if y is a multiple of x
isMultipleOf :: Integral a => a -> a -> Bool
isMultipleOf 0 _ = False
isMultipleOf x y = y `mod` x == 0

isMultipleOf3 = isMultipleOf 3
isMultipleOf5 = isMultipleOf 5

isMultiple :: Integer -> Bool
isMultiple x = isMultipleOf3 x || isMultipleOf5 x

sumMultiples :: [Integer] -> Integer
sumMultiples xs = sum (filter isMultiple xs)

main = do
    (n:ns) <- getArgs
    let max = read n
    putStrLn $ "The sum of all multiples of 3 or 5 below " ++ n ++ " is " ++
        (show $ sumMultiples [1..(max-1)])
