---
type: blog
title: Adventures in Elm - Live to blog the tale
description: Setting up a blog
published: "2015-10-12"
author: Günther Enthaler
image: /images/article-covers/mountains.jpg
---

So I've decided that [Elm](http://elm-lang.org) is the One True (Web) Language, and I'm looking for a way to get into it.

I do a fair amount of web programming in my day job, but it tends to be server side templating, generally [Java + JSPs](http://java.oracle.com) with [Struts](https://struts.apache.org) or [Spring MVC](https://spring.io/guides/gs/serving-web-content), occasionally [GWT](http://www.gwtproject.org/). I've recently done a little [Angular JS](https://angularjs.org) work, but I'm not terribly happy with the magic (digest cycles *et al*) it entails.

I want to document my Elm journey, and I've decided to use [Jekyll](http://jekyllrb.com) on [Github](https:github.com) to do so.

The instructions [here](https://help.github.com/articles/using-jekyll-with-pages/) are clear enough, but don't give many hints on what to do when things go wrong. As a former C programmer who's been spoilt by Java and [Maven](http://maven.apache.org), the errors that pop up are very reminiscent of my C days.

I was getting errors with the `nogiri` dependency, turns out I had a [Homebrew](http://brew.sh) install of `libxml2` which was breaking my build. Unlinking that fixed things up:

```
brew unlink libxml2
bundle install
bundle exec jekyll serve
```

Lookin' good!
