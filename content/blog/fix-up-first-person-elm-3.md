---
title: Adventures in Elm - Back into the fray.
description: Half a year later, finally getting into it.
type: blog
tags: elm
published: "2016-03-30"
author: Günther Enthaler
image: /images/article-covers/mountains.jpg
---

Since the last post, a new job hit, as well as summer with its surf lifesaving duties, so I just haven't had time to look at this.

In the last half year there have been a few changes in the community, and a new version of the compiler (0.16.0) implementing some changes in the language.

There've also been some new [Elm][Elm] projects come along to assist in bootstrapping and running new [Elm][Elm] projects; such as [elm-ui][gdotdesign/elm-ui], [elm-server][maxgurewitz/elm-server] and [elm-generator-spa][jmfirth/generator-elm-spa].

After installing the newest version and trying to rebuild, there were some new things to fix up. Some of the packages are now in [elm-community][elm-community], including and especially [elm-webgl][elm-community/elm-webgl].

Rather than fixing up [first-person.elm][first-person.elm] to work with the new compiler, it's easier to use [elm-community/elm-webgl][elm-community/elm-webgl]/examples/first-person.elm, where the work has already been done.

Revised checklist:

- [x] copy over [elm-community/elm-webgl][elm-community/elm-webgl]/examples/first-person.elm
- [x] fix up elm-package.json
- [ ] remove the functionality I don't care about e.g. jumping
- [ ] use [evancz/first-person-elm][evancz/first-person-elm] to guide me in rewriting the functionality I do care about e.g. rotating the view.
- [ ] CI using [TravisCI][TravisCI]
- [ ] Continuously deploy the built application to gh-pages

[evancz/elm-svg]: https://github.com/evancz/elm-svg
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
