import Html exposing (text)
import List exposing (..) 
import Tuple exposing (..) 

ordinal s = case s of 
  "1"-> "first"
  "2"-> "second"
  "3"-> "third"
  _-> s ++ "th"

lagSang l =
  case l of 
    [] -> ""
    v::h -> lagSang(h) 
      ++ (v |> first |> ordinal |> \s -> "\r\nOn the " ++ s ++ " day of Christimas my true love gave to me\r\n")
      ++ (l |> map (\(dag,gave)-> dag ++ gave ) |> foldr (++) "") 

main =
  ["partridge in a pear tree","turtle doves","french hens",
   "calling birds"]
  |> indexedMap (,)
  |> map (\(dag,gave)->(toString(dag+1)," "++gave++"\r\n"))
  |> reverse
  |> lagSang
  |> text
