-- BookInfo is a type constructor
-- Book is a value constructor
data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

myInfo = Book 92342342 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]

-- type synonyms
type CustomerID = Int
type ReviewBody = String
data BookReview = BookReview BookInfo CustomerID ReviewBody

type BookRecord = (BookInfo, BookReview)

type CardHolder = String
type CardNumber = String
type Address = [String]

-- algebraic data types allow for one of several value constructors
data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

-- it is a good way to make enumerations
data Roygbiv = Red
             | Orange
             | Yellow
             | Green
             | Blue
             | Indigo
             | Violet
               deriving (Eq, Show)

-- record syntax
data Customer = Customer {
      customerID :: CustomerID,
      customerName :: String,
      customerAddress :: Address
    } deriving (Show)

