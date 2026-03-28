---
title: Adventures in Elm - Let's get started
description: Now that we have a basic blog format going, let's do something with Elm...
type: blog
published: "2015-10-13"
author: Günther Enthaler
image: /images/article-covers/mountains.jpg
---

There are plenty of things I could be working on with Elm, but I thought I'd write a port of [Maze Wars](https://en.wikipedia.org/wiki/Maze_War). I have fond memories of playing it in 1988 on Mac SEs in the Sydney Uni computer lab.

A quick scan of the web found surprisingly few ports of the game. One that caught my eye was [Maze Wars SVG](mazewarssvg.sourceforge.net), so I thought sure, I can write that in Elm using [evancz/elm-svg][evancz/elm-svg]. However, it looks like that API is for raw SVG only i.e. 2D, and I didn't fancy having to write a 3D SVG library in order to move forward.

A google on "3d elm" popped up [johnpmayer/elm-webgl][johnpmayer/elm-webgl] and [evancz/first-person-elm][evancz/first-person-elm]. Evan assures us that [evancz/first-person-elm][evancz/first-person-elm] is "architected to scale nicely as you add more entities", so let's put that to the test :-).

Over the last couple of years I've found using [BDD](dannorth.net/introducing-bdd) and [Cucumber/Gherkin](https://cucumber.io/) to be an enormous help in my dev work. It provides a ubiquitous language that allows me to start thinking about the next thing to write, allows me to communicate what I'm doing to *anyone* and encourages refactored code and robust tests.

So here's a first go:

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

Note that I'm going for an skeleton here. Just draw some walls, don't bother about floor or ceiling or enemies or orientation helpers or maze maps or textures or sounds, for now.

First step is to create a project by creating [genthaler/elm-maze-war][genthaler/elm-maze-war] and copying in the content of [evancz/first-person-elm][evancz/first-person-elm].

and try building:

```bash
elm package install
```

and I get

```
-- SYNTAX PROBLEM ------------------------------------------------- src/Main.elm

I ran into something unexpected when parsing your code!

3| import Graphics.WebGL (..)
                         ^
I am looking for one of the following things:

    reserved word `as`
    reserved word `exposing`
    whitespace
```

Oh dear, this project doesn't actually build.

Having a look at elm_dependencies.json:

```json
{
    "version": "0.1",
    "summary": "concise, helpful summary of your project",
    "description": "full description of this project, describe your use case",
    "license": "BSD3",
    "exposed-modules": [],
    "elm-version": "0.12.3",
    "dependencies": {
        "johnpmayer/elm-webgl": "0.1.1",
        "johnpmayer/elm-linear-algebra": "1.0.1"
    },
    "repository": "https://github.com/USER/PROJECT.git"
}
```

This is intended for Elm 0.12.3 while I have 0.15.1 (current at time of writing).

Now I could just get it working in this project, but this looks like a good opportunity to fix up another project and get my hands dirty with the [GitHub Flow][GitHub Flow].


[evancz/elm-svg]: https://github.com/evancz/elm-svg
[evancz/first-person-elm]: https://github.com/evancz/first-person-elm
[johnpmayer/elm-webgl]: https://github.com/johnpmayer/elm-webgl
[genthaler/elm-maze-war]: https://github.com/genthaler/elm-maze-war
[GitHub Flow]: https://guides.github.com/introduction/flow
