-- Recursive types
data List a = Cons a (List a)
            | Nil
              deriving (Show)

-- convert a built-in list of type [a] to a List
fromList :: [a] -> List a
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

-- convert a List to a [a]
toList :: List a -> [a]
toList (Cons x xs) = x : toList xs
toList Nil         = []
