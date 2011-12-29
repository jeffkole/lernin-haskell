data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

data ShitTree a = ShitNode a (Maybe (ShitTree a)) (Maybe (ShitTree a))
                  deriving (Show)

goodTree = Node "Root" (Node "Leaf A" Empty Empty) (Node "Leaf B" Empty Empty)
badTree  = ShitNode "Root" (Just (ShitNode "Leaf A" Nothing Nothing)) (Just (ShitNode "Leaf B" Nothing Nothing))
