import Data.List.Split as Split

first (requiredElement, _, _) = requiredElement
second (_, requiredElement, _) = requiredElement
third (_, _, requiredElement) = requiredElement

splitWords word = Split.splitOn  "," word

state = [0, 1, 2, 3, 4, 5, 6]
alphabet = ['a', 'b']
s_0 = 0
s_f = [0, 3, 5]
transition = [(0, 'a', 1), (0, 'b', 2), (2, 'b', 3), (3, 'b', 4), (4, 'b', 3), (1, 'b', 5), (5, 'b', 6), (6, 'b', 5), (1, 'a', 0)]
quantity = 6

getTrans state = filter(\x-> first x == state) transition

getDest state symb = third ((filter(\x-> first x == state && second x == symb) transition)!!0)
checkWhatStateAndWord' word state k | k>=length word = (state, word)
                                    | otherwise = checkWhatStateAndWord' word (getDest state (word!!k)) (k+1) 
checkWhatStateAndWord word = checkWhatStateAndWord' word s_0 0

goTrans words pr_word trans k | k>=length trans = words
                              | otherwise = goTrans (doAutomat' (writeWords words (pr_word++[(second (trans!!k))])) 
                              (checkWhatStateAndWord (pr_word++[(second (trans!!k))])) (length (pr_word++[(second (trans!!k))]))) pr_word trans (k+1)

doAutomat' words state_word count | count>=quantity =  words
                                  | otherwise = goTrans words (snd state_word) (getTrans (fst state_word)) 0

writeWords words new_word = words++","++new_word

doAutomat = doAutomat' "" (s_0, "") 0

isRightWord word = fst(checkWhatStateAndWord word) `elem` s_f

findNeededLengthWords words = filter(\x->length x == quantity) (splitWords words)

findNeededWords words = filter(\x->isRightWord x) (findNeededLengthWords words)

main = do
    let t = doAutomat
    let res = findNeededWords t
    print res