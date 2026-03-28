---
title: Adventures in Elm - Let's get out there
description: I haven't pushed anything yet...
type: blog
tags: elm
published: "2016-05-05"
author: Günther Enthaler
image: /images/article-covers/mountains.jpg
---

For what it's worth, I managed to port [elm-community/elm-webgl][elm-community/elm-webgl]/examples/first-person.elm to [Elm][Elm] 0.16.0 and [evancz/start-app][evancz/start-app]. I've published that to [genthaler/first-person-start-app.elm][genthaler/first-person-start-app.elm].

Using that as a guide, I should have an updated version of
[evancz/first-person-elm][evancz/first-person-elm] up at [genthaler/first-person-elm][genthaler/first-person-elm] fairly soon.

It took a lot longer than it should have. I probably should have tried my hand at a regular HTML SPA first, but this looked like more fun. Some of the things that got me were:

- I didn't understand how `Task`s, the `inputs` entry in the Config object and `port`s all hung together, and therefore how to translate the more hand-wired code in [elm-community/elm-webgl][elm-community/elm-webgl]/examples/first-person.elm to [evancz/start-app][evancz/start-app]. Hopefully it stands up to critical analysis.
- I'm using [Atom][Atom]. Mostly because it's free. But it's a memory hungry, rather flaky beast, at least when coding in Elm. It frequently stops highlighting errors, somewhat frequently crashes.  I couldn't get Go to Declaration working. I played with Sublime (nice, but not free), Brackets, LightTable, but the Elm integration wasn't quite what I was looking for. I'm a Java/Eclipse programmer during the day, so I'm accustomed to having a free IDE that does a *lot* for me.
- [Elm][Elm] 0.16.0 isn't (or wasn't when I started this exercise) very widely supported; there were some pretty substantial changes, lots of modules hadn't been updated, and much of the documentation out there was outdated (e.g. references to the `lift` and `<~` family).
- Time. Functional and reactive programming *are* paradigm shifts, and though I've been playing around with functional languages like Haskell/Gofer, Clean and Erlang, that's not the same as really getting into it. So I needed to really put my head down and nut it out, something I hadn't needed to do for a while.
- *No* idea about WebGL. Oh well, have to start somewhere.

[genthaler/first-person-start-app.elm]: https://gist.github.com/genthaler/41397fc8557ee6de9191f2b5df6f5373
[Atom]: https://atom.io
[evancz/elm-svg]: https://github.com/evancz/elm-svg
[evancz/start-app]: https://github.com/evancz/start-app
[evancz/first-person-elm]: https://github.com/evancz/first-person-elm
[genthaler/first-person-elm]: https://github.com/genthaler/first-person-elm
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
