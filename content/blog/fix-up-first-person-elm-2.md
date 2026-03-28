---
title: Adventures in Elm - Fix up first-person.elm instead.
description: Fixing evancz/first-person-elm is just too much work for now, let's go with a simpler solution.
type: blog
tags: elm
published: "2015-10-23"
author: Günther Enthaler
image: /images/article-covers/mountains.jpg
---

I thought that modernizing [evancz/first-person-elm][evancz/first-person-elm] would be the right thing to do, but doing so meant having to

1. grok the code up front and/or
2. understand the syntax and semantics of a few different Elm versions and how to translate from one to the other.

That's much more than I want to do for this exercise. Just trying to work out what's going on has cost me a week of spare time and a fair bit of enthusiasm for Elm, so I'm going to fall back on using the [simpler version][first-person.elm] from the Elm examples, which has the advantage of already running in Elm 0.15.1.

Revised checklist:

- [ ] copy over [first-person.elm][first-person.elm]
- [ ] remove the functionality I don't care about e.g. jumping
- [ ] use [evancz/first-person-elm][evancz/first-person-elm] to guide me in rewriting the functionality I do care about e.g. rotating the view.

One thing I've found while refactoring the code is that tuples are probably not the best choice for a datatype that contains different types, since they don't self-document the same way that records do. In the world of C- and Java-like languages, method signatures can have the same issue, but most modern IDEs patch this weakness by showing the consumer the method signature from its declaration.

If I were the master of this particular universe, I'd be inclined to spend more time developing language features and patterns around records and maybe deprecate tuples entirely.

Here's my initial specification again:

``` gherkin
Feature: Stand and turn in a box
	In order to see what's in front of me
	As a player
	I want the walls around me to be drawn correctly

Scenario: Staring at a wall
	Given I am in a box
	Then I should see a wall 0 units in front
	And I should see a wall 0 units to the left
	And I should see a wall 0 units to the right

Scenario: Turn
	Given I am in a box
	When I turn left
	Then I should see a wall 0 units in front
	And I should see a wall 0 units to the left
	And I should see a wall 0 units to the right
```

The current implementation has a concept of velocity. I need to make a choice between real-time and turn-based game play. I think for the moment, I'll make it turn-based since it makes the implementation so much easier, at the expense of some jerkiness in the display.

[evancz/elm-svg]: https://github.com/evancz/elm-svg
[evancz/first-person-elm]: https://github.com/evancz/first-person-elm
[genthaler/first-person-elm]: https://github.com/genthaler/first-person-elm
[johnpmayer/elm-webgl]: https://github.com/johnpmayer/elm-webgl
[genthaler/elm-maze-war]: https://github.com/genthaler/elm-maze-war
[GitHub Flow]: https://guides.github.com/introduction/flow
[first-person.elm]: https:github.com/elm-lang/elm-lang.org/tree/master/src/examples/first-person.elm
