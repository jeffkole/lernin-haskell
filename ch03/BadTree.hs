-- page 68 (pdf 108)
--
-- In the first example, it is illegal to use the same name twice in a pattern
-- match.  The second example uses a guard to check that the values are the
-- same.
bad_nodesAreSame (Node a _ _ ) (Node a _ _ ) = Just a
bad_nodesAreSame _             _             = Nothing

nodesAreSame (Node a _ _) (Node b _ _) | a == b = Just a
nodesAreSame _            _                     = Nothing
