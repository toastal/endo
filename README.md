# endo

Endo for Elm: Endomorphisms to simplify code

- - -

# You Don't Need This Package

###### But you can use it if you want

This mostly exists to show a pattern since this package is only one thing.

```elm
type alias Endo a =
    a -> a
```

So why is this useful? Well for one it can make type signatures more concise, but more importantly, it lets you know that the type didn’t change. Let’s look at an example of  common code:

```elm
type alias P =
    { x : Int, y : Int }

type alias Point =
    Point P

coordinates : List Point
coordinates =
    [ Point { x = 0, y = 0 }
    , Point { x = 1, y = 2 }
    , Point { x = 8, y = 4 }
    ]
```

So one task might be that we want to reset all of the x coordinates to 0. Normally we’d do this with `List.map`.

```elm
setX : a -> { r | x : a } -> { r | x : a }
setX x_ r =
    { r | x = x_ }

mapPoint : (P -> P) -> Point -> Point
mapPoint fn (Point p) =
    Point (fn p)

newCoordinates : List Point
newCoordinates =
    List.map (mapPoint (setX 0)) coordinates
```

That’s fine and it works, but it’s a little verbose and when mapping a `Point` we really want to ensure that cannot modify the types along the line. Because Elm frowns upon the use of optics, a map function is usually used as a _setter_ of sorts and a setter shouldn’t change the types.

So if we go back to `Endo`, you can see that we can say these types do _not_ change.

```elm
type alias Endo a =
    a -> a

setX : a -> Endo { r | x : a }
setX x_ r =
    { r | x = x_ }

mapPoint : Endo P -> Endo Point
mapPoint fn (Point p) =
    Point (fn p)

newCoordinates : List Point
newCoordinates =
    List.map (mapPoint (setX 0)) coordinates
```

So, you can pull this package in … or not, and just make you own `Endo` in your project 🤷.
