module Endo exposing (Endo)

{-| Basic `Endo` to clean up code.


# Definition

@docs Endo

-}


{-| This is it.
-}
type alias Endo a =
    a -> a
