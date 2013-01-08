-- 2520 is the smallest number that can be divided by each of the numbers from
-- 1 to 10 without any remainder.
--
-- What is the smallest positive number that is evenly divisible by all of the
-- numbers from 1 to 20?

-- import Data.List
import System

isEvenlyDivisibleBy :: Integral a => [a] -> a -> Bool
isEvenlyDivisibleBy xs y = and $ map (\x -> y `mod` x == 0) xs

-- This probably works (it does for 1..10), but it takes a long time:
-- head $ filter (isEvenlyDivisibleBy [1..20]) [1..]

leastCommonMultiple :: Integral a => [a] -> a
leastCommonMultiple = foldl lcm 1

main = do
    n:ns <- getArgs
    let l = leastCommonMultiple [1..(read n)]
    putStrLn $ "The smallest positive number that is evenly divisible by " ++
        "all of the numbers from 1 to " ++ n ++ " is " ++ show l

{-
-- Minimize the number of checks to do by removing duplicate factors.
-- ie, if a number is divisible by 20, then it is also divisible by
-- 2, 4, 5, and 10.

factors :: Integral a => a -> [a]
factors x =
    -- Flatten the list of pairs using foldl
    foldl (++) [] $
    -- Find all factors in list pairs (except for 1 and the number itself)
    [ [f, x `div` f] | f <- [2..(floor $ sqrt $ fromIntegral x)], x `mod` f == 0]

-- 20:[19..1] \\ factors 20
removeFactors :: Integral a => [a] -> [a]
removeFactors xs = foldl (\as b -> as `intersect` (xs \\ factors b)) xs xs


 1   1           1
 2   2           2
 3   3           3
 4   2,4     2
 5   5           5
 6   2,3,6   3
 7   7       7   7    7
 8   2,4,8   4   4    4?
 9   3,9     3   3?   9
10   2,5,10  5       10

 1   1
 6   2,3,6   <- both factors already in
 7   7
 8   2,4,8   <-
 9   3,9
10   2,5,10

 1   1
 4   2,4
 7   7
 9   3,9
10   2,5,10

1,2 -> 2
2,3 -> 6
6,4 -> 12
12,5 -> 60
60,6 -> 60
60,7 -> 420
420,8 -> 840
840,9 -> 2520
2520,10 -> 2520

-}
