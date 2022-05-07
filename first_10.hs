import Data.List (delete)
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs)= qsort [y | y <- xs, y<x ]
                ++ [x]
                ++ qsort [y | y <- xs, y>=x]

removeNSmallest' :: (Eq a) => [a] -> [a] -> [a]
removeNSmallest' [] [] = []
removeNSmallest' (x:xs) lst
         | x `elem` lst = removeNSmallest' xs (delete x lst)
         | otherwise = x : removeNSmallest' xs lst

removeNSmallest :: Ord a => Int -> [a] -> [a]
removeNSmallest n xs = removeNSmallest' xs (take n(qsort xs))

