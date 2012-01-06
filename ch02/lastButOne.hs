-- Write a function that returns the element before the last
lastButOne :: [a] -> a
lastButOne xs
    | length xs <= 1 = error "Not enough elements"
    | otherwise      = head (drop (length xs - 2) xs)

lastButOne' :: [a] -> Maybe a
lastButOne' xs
    | length xs <= 1 = Nothing
    | otherwise      = Just (lastButOne xs)

lastButOne'' :: [a] -> Maybe a
lastButOne'' [] = Nothing
lastButOne'' xs = if null (tail xs)
                  then Nothing
                  else Just (lastButOne xs)

-- This does not actually work, because the _ at the beginning can only match
-- a single list element.  It cannot match any size list.
lastButOne''' :: [a] -> Maybe a
lastButOne''' (_:x:_:[]) = Just x
lastButOne''' (x:_:[])   = Just x
lastButOne''' _          = Nothing

lastButOne'''' :: [a] -> a
lastButOne'''' []       = error "Not enough elements"
lastButOne'''' (x:_:[]) = x
lastButOne'''' xs       = lastButOne'''' (tail xs)

lastButOne''''' :: [a] -> Maybe a
lastButOne''''' [] = Nothing
lastButOne''''' xs
    | null (tail xs) = Nothing
    | otherwise      = Just (head (drop (length xs - 2) xs))
