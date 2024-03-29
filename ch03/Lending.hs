-- page 62 (pdf 102)
-- using let/in
lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

-- page 63 (pdf 103)
-- using where
lend2 amount balance = if amount < reserve * 0.5
                       then Just newBalance
                       else Nothing
    where reserve = 100
          newBalance = balance - amount

lend3 amount balance
    | amount <= 0            = Nothing
    | amount > reserve * 0.5 = Nothing
    | otherwise              = Just newBalance
    where reserve    = 100
          newBalance = balance - amount
