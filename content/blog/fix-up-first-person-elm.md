---
title: Adventures in Elm - Fix up evancz/first-person-elm
description: If we're going to use evancz/first-person-elm, we need to get it to compile and run with current Elm.
type: blog
published: "2015-10-15"
author: Günther Enthaler
image: /images/article-covers/mountains.jpg
---

In my last post, I was having trouble using [evancz/elm-svg][evancz/elm-svg], since it hasn't been updated to work with Elm 0.15.1.

Rather than just patch the code as I integrate it into my project, I'll fix it first for great good.

So the [GitHub Flow][GitHub Flow] seems to be a fairly simple process, not dissimilar to stuff I've done in my work.

As I'm not a member of [evancz/first-person-elm][evancz/first-person-elm], I'll be using Fork-Pull rather than Shared Repository.

Here's a checklist:

- [x] Fork [evancz/first-person-elm][evancz/first-person-elm] to [genthaler/first-person-elm][genthaler/first-person-elm]
- [x] Branch my fork (Upgrade-to-Elm-0.15.1)
- [ ] Fix my branch
- [ ] Create pull request
- [ ] Have a chat
- [ ] Merge [genthaler/first-person-elm][genthaler/first-person-elm] back to [evancz/first-person-elm][evancz/first-person-elm].

It occurs to me that it might be a good idea to allow comments in my blog, so I'll set that up too...

[evancz/elm-svg]: https://github.com/evancz/elm-svg
[evancz/first-person-elm]: https://github.com/evancz/first-person-elm
[genthaler/first-person-elm]: https://github.com/genthaler/first-person-elm
[johnpmayer/elm-webgl]: https://github.com/johnpmayer/elm-webgl
[genthaler/elm-maze-war]: https://github.com/genthaler/elm-maze-war
[GitHub Flow]: https://guides.github.com/introduction/flow
