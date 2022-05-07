split' :: [a] -> [a] -> [a] -> [a] -> [[a]]
split' [] x y z = [x,y,z]
split' p x y z  | (length p) >= 3 = split' (drop 3 p) (x ++ [p1]) (y ++ [p2]) (z ++ [p3]) 
                | (length p) == 2 = [(x ++ [p1]) , (y ++ [p2]),z]
                | (length p) == 1 = [(x ++ [p1]),y,z]
                   where p1 = p !! 0
                         p2 = p !! 1
                         p3 = p !! 2
 
split :: [a] -> [[a]]
split x = split' x [] [] []