{-
   Copyright © 2019–2021 toastal <toastal@posteo.net> (https://toast.al)

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-}

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
