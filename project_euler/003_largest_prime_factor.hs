-- The prime factors of 13195 are 5, 7, 13, and 29.
--
-- What is the largest prime factor of the number 600851475143?

import System
import Data.List

factors :: Integral a => a -> [a]
factors x =
    sort $
    -- Flatten the list of pairs using foldl
    foldl (++) [] $
    -- Find all factors in list pairs.
    -- `sqrt` takes a Floating, but x is Integral, so convert it using `fromIntegral`
    [ [f, x `div` f] | f <- [1..(floor $ sqrt $ fromIntegral x)], x `mod` f == 0]

primeFactors :: Integral a => a -> [a]
primeFactors x = filter isPrime $ factors x
    where isPrime x = factors x == [1, x]

-- A faster way to check for prime without generating all factors.
-- If any number from 2 up to the sqrt of the number is a factor, then
-- n is not prime.
isPrime n = not $ or $ [ True | x <- [2..(floor $ sqrt $ fromIntegral n)], n `mod` x == 0]

main = do
    (x:xs) <- getArgs
    putStrLn $ "Largest prime factor of " ++ (show x) ++ " is " ++ (show $ maximum $ primeFactors $ read x)
