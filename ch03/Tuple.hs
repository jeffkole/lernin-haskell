third (a, b, c) = c

-- while this is complicated, it is far from exhaustive
complicated (True, a, x:xs, 5) = (a, xs)
-- but this makes it exhaustive
complicated (a, b, c, d) = (b, c)
