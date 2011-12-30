-- page 66 (pdf 106)
-- the case expression lets us use pattern matching
-- unwrap a Maybe, using a default value if the Maybe is a Nothing
-- (This function is defined in Data.Maybe)
fromMaybe defval wrapped =
    case wrapped of
        Nothing    -> defval
        Just value -> value
