ascend' :: (Ord a) => [a] -> a -> [a] -> [[a]]
ascend' [] p asc = [asc++[p]]
ascend' (x:xs) p asc | (x >= p) = ascend' xs x (asc++[p])
                     | otherwise = [asc++[p]] ++ ascend' xs x []
                   
ascend :: (Ord a) => [a] -> [[a]]
ascend (x:xs) = ascend' xs x []    