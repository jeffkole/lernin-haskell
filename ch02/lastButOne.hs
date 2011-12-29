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
