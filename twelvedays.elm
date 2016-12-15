import List exposing (..) 
import Tuple exposing (..) 

ordinal n = 
  case n of 
    1-> "first"
    2-> "second"
    3-> "third"
    _-> toString(n) ++ "th"

lagSang l =
  case l of 
    [] -> ""
    v::h -> lagSang(h) 
      ++ (v |> first |> ordinal |> \s -> "\r\nOn the " ++ s ++ " day of Christimas my true love gave to me\r\n")
      ++ (l |> map (\(dag,gave)-> toString(dag) ++ " "++ gave ++ "\r\n" ) |> foldr (++) "") 

main =
 ["partridge in a pear tree","turtle doves","french hens","calling birds","golden rings","geese a laying",
 "swans a swimming","maids a milking","ladies dancing","lords a leaping","pipers piping","drummers drumming"]
  |> indexedMap (,)
  |> map (\(dag,gave)->(dag+1,gave))
  |> reverse
  |> lagSang
  |> syng
