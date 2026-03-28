---
title: Adventures in Elm - First Person Elm with StartApp
description: First real deliverable, delivered
type: blog
tags: elm
published: "2016-05-07"
author: Günther Enthaler
image: /images/article-covers/mountains.jpg
---

I've (finally) modified [evancz/first-person-elm][evancz/first-person-elm] to follow [The Elm Architecture][elm-architecture-tutorial], in particular using [evancz/start-app][evancz/start-app]; it's on display at [genthaler/first-person-elm][genthaler/first-person-elm].

I've started a [pull request](https://github.com/evancz/first-person-elm/pull/7) for this; we'll see what Evan thinks.

The main takeaways from this were:

- I miss having an introspecting, interactive debugger. It's something one gets quite used to with Java, and even JavaScript. If the debugger was available, using Debug.watch() might be OK, but because of the hopefully momentary incompatibility between the debugger and `port`s, that's not an option. So I'm reduced to the equivalent of the printf() statement that I was using in C thirty-odd years ago (*viz.* Debug.log()).
- I've no idea how to write an automated test for this. I don't think I'm alone.
- Thanks to Evan for making this available in the first place.
- Thanks to lepoetemaudit for  [lepoetemaudit/elm-terrain][lepoetemaudit/elm-terrain], which helped a great deal with restructuring.

[elm-architecture-tutorial]: https://github.com/evancz/elm-architecture-tutorial
[lepoetemaudit/elm-terrain]: https://github.com/lepoetemaudit/elm-terrain/tree/elm-architecture
[genthaler/first-person-start-app.elm]: https://gist.github.com/genthaler/41397fc8557ee6de9191f2b5df6f5373
[Atom]: https://atom.io
[evancz/elm-svg]: https://github.com/evancz/elm-svg
[evancz/start-app]: https://github.com/evancz/start-app
[evancz/first-person-elm]: https://github.com/evancz/first-person-elm
[genthaler/first-person-elm]: https://github.com/genthaler/first-person-elm/tree/start-app-0.16.0
[johnpmayer/elm-webgl]: https://github.com/johnpmayer/elm-webgl
[genthaler/elm-maze-war]: https://github.com/genthaler/elm-maze-war
[GitHub Flow]: https://guides.github.com/introduction/flow
[first-person.elm]: https:github.com/elm-lang/elm-lang.org/tree/master/src/examples/first-person.elm
[elm-community]: https://github.com/elm-community
[elm-community/elm-webgl]: https://github.com/elm-community/elm-webgl
[gdotdesign/elm-ui]: https://github.com/gdotdesign/elm-ui
[maxgurewitz/elm-server]: https://github.com/maxgurewitz/elm-server
[jmfirth/generator-elm-spa]: https://github.com/jmfirth/generator-elm-spa
[TravisCI]: https://travis-ci.org
[Elm]: http://elm-lang.org
