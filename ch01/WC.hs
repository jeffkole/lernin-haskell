-- change 'lines' to 'words' to count words, and remove it altogether to 
-- count the characters
main = interact wordCount
    where wordCount input = show (length (lines input)) ++ "\n"
