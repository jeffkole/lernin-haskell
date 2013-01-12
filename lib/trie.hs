-- A trie

module Trie(Trie) where

data Trie a = Trie { value :: Maybe a
                   , children :: [(a, Trie a)] }
                   deriving (Eq, Show)

{-
trie = Trie Nothing
  [('a', Trie (Just 'a')
         [('d', Trie (Just 'd')
                [('d', Trie (Just 'd') []),
                 ('s', Trie (Just 's') [])]
          ),
          ('s', Trie (Just 's') [])
         ])]
-}

-- Allows non-leaf nodes to be counted as official "word" values
-- This is no good.

element :: (Eq a) => [a] -> Trie a -> Bool
element []     t = case value t of
                        Nothing -> False
                        Just _  -> True
element (k:ks) t = case lookup k (children t) of
                        Nothing -> False
                        Just ct -> element ks ct

{-
 - Trie Nothing []
 - Trie Nothing [('a', Trie (Just 'a' [])]
 - Trie Nothing [('a', Trie (Just 'a' [('d', Trie 'd' [])])]
 -
 - Trie 'd' []
 - Trie 'd' [('o', Trie (Just 'o' []))]
 -}

-- TODO: does not seem to work when adding as, asp, ai, asshole (ai is gone)
-- works for app, ass, ai, crap

insert :: (Eq a) => Trie a -> [a] -> Trie a
insert t []     = t
insert t (k:ks) = case lookup k (children t) of
                        Nothing -> Trie (value t) ((k, insert (Trie (Just k) []) ks):(children t))
                        Just ct -> Trie (value t) ((k, insert ct ks):[])

{-
create :: [a] -> Trie a
create v:vs = insert Trie v [] vs

insert :: Trie a -> [a] -> Trie a
insert Trie prefix suffixes v:vs =
-}
