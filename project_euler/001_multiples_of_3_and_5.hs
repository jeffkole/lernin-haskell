-- If we list all the natural numbers below 10 that are multiples of 3 or 5,
-- we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
-- Find the sum of all the multiples of 3 or 5 below 1000.

import System
import Control.Applicative

-- Uses an applicative functor.
-- Map `isMultipleOf` over 3 and 5 and apply to x (as a list, because the
-- list is the applicative functor.  This results in a list of Bool (the
-- result from `isMultipleOf`), on which `or` is then called, because we want
-- multiples of 3 or of 5.

sumMultiples :: Integral a => [a] -> a
sumMultiples xs = sum (filter isMultiple xs)
    where isMultiple x = or $ isMultipleOf <$> [3, 5] <*> [x]
          isMultipleOf 0 _ = False
          isMultipleOf x y = y `mod` x == 0

main = do
    (n:ns) <- getArgs
    let max = read n
    putStrLn $ "The sum of all multiples of 3 or 5 below " ++ n ++ " is " ++
        (show $ sumMultiples [1..(max-1)])
