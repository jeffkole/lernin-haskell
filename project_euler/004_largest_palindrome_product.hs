-- A palindromic number reads the same both ways.  The largest palindrome
-- made from the product of two 2-digit numbers is 9009 = 91 x 99.
--
-- Find the largest palindrome made from the product of two 3-digit numbers.

isPalindrome :: Integral a => a -> Bool
isPalindrome n =
    let ns = show n
    in ns == reverse ns

largestPalindrome =
    maximum $
    [ x * y | x <- [100..999], y <- [100..999], isPalindrome (x * y) ]

main = do
    let p = largestPalindrome
    putStrLn $ "The largest palindrom made from the product of two 3-digit numbers is " ++ show p
