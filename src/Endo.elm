module Endo exposing (Endo, Over)

{-| Basic `Endo` to clean up code.


# Definition

@docs Endo, Over

-}


{-| This is this.
-}
type alias Endo a =
    a -> a


{-| This is that.
-}
type alias Over outer inner =
    Endo inner -> Endo outer
