---
{
  "type": "blog",
  "author": "Günther Enthaler",
  "title": "TDD in a corporate environment",
  "description": "Some thoughts on why TDD doesn't seem to be a thing in corporate software development",
  "image": "/images/article-covers/hello.jpg",
  "published": "2012-09-01"
}
---

When people talk about brittle tests, the scenario that comes most quickly to mind is automated testing of user interfaces, that specifies behaviour at the UI element level. However, in most of the (mostly corporate/finance) environments I've worked in, few people are test infected, so many developers simply don't care about automated unit tests; unit tests often aren't easy to read as to their purpose, so new code which breaks any extant unit tests will often result in that unit test being disabled or commented out, or even in having the test phase in the build turned off; 

Code review consists mostly of comparisons of source code between revisions, and any change that's not strictly related to the change at hand is discouraged. This means that refactoring, or even reformatting, rarely happens. There's generally a large suite of applications, written by different generations of developers, so the architecture, code style and testing philosophy can vary widely, so it can be difficult to read what any unit test is actually testing. Developers will often be thrown in the deliver a fix quickly, so code which breaks any extant unit tests will generally result in that unit test being disabled or commented out, or even in having the test phase in the build turned off.

Also, in general refactoring code will always mean refactoring unit tests, but quite often having to completely rewrite the related unit tests due to too many dependencies. I find that BDD circumvents some of these issues by requiring less analysis as to what they're testing, and requiring much less test rewriting when refactoring.
