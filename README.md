# endo

Endo for Elm: Endomorphisms to simplify code

## You Don't Need This Package

###### But you can use it if you want

This mostly exists to show a pattern since this package is only one thing (with a bonus second thing).

```elm
type alias Endo a =
    a -> a
```

So why is this useful? Well for one it can make type signatures more concise, but more importantly, it lets you know that the type didn’t change. Let’s look at an example of  common code:

```elm
type alias P =
    { x : Int, y : Int }

type Point
    = Point P

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

Bonus round: We can take it a little further and make on `Over` type that is should remind us of `over` from Optical libraries in other functional languages. Which represents this function idea of mapping a value in a container.

```elm
type alias Endo a =
    a -> a

type alias Over outer inner =
    -- Equivalent to (a -> a) -> b -> b
    Endo inner -> Endo outer

setX : a -> Endo { r | x : a }
setX x_ r =
    { r | x = x_ }

overPoint : Over Point P
overPoint fn (Point p) =
    Point (fn p)

newCoordinates : List Point
newCoordinates =
    List.map (overPoint (setX 0)) coordinates
```

So, you can pull this package in … or not, and just make you own `Endo` in your project 🤷.

---

## Project & Community Notes

This project is regrettably available on [GitHub](https://github.com/toastal/endo). The Elm community has tied itself to the closed-source, Microsoft-owned code forge of GitHub for package registry and identity. This does not protect the privacy or freedom of its community members.

---

## License

This project is licensed under Apache License 2.0 - [LICENSE](./LICENSE) file for details.

## Funding

If you want to make a small contribution to the maintanence of this & other projects

- [Liberapay](https://liberapay.com/toastal/)
- [Bitcoin: `39nLVxrXPnD772dEqWFwfZZbfTv5BvV89y`](link:bitcoin://39nLVxrXPnD772dEqWFwfZZbfTv5BvV89y?message=Funding%20toastal%E2%80%99s%20Elm%20endo%20development
) (verified on [Keybase](https://keybase.io/toastal/sigchain#690220ca450a3e73ff800c3e059de111d9c1cd2fcdaf3d17578ad312093fff2c0f))
- [Zcash: `t1a9pD1D2SDTTd7dbc15KnKsyYXtGcjHuZZ`](link:zcash://t1a9pD1D2SDTTd7dbc15KnKsyYXtGcjHuZZ?message=Funding%20toastal%E2%80%99s%20Elm%20endo%20development) (verified on [Keybase](https://keybase.io/toastal/sigchain#65c0114a3c8ffb46e39e4d8b5ee0c06c9eb97a02c4f6c42a2b157ca83b8c47c70f))
