---
{
  "type": "blog",
  "author": "Günther Enthaler",
  "title": "TDD vs BDD",
  "description": "A discussion on the relative merits of TDD and BDD",
  "image": "/images/article-covers/hello.jpg",
  "published": "2007-04-02"
}
---

It's my experience in corporate environments that refactoring an application is difficult since once an artifact is created, it is difficult to remove that artifact because of the process around any change.

When an artifact is bound in by a unit test, it becomes even harder to refactor applications since one wants t maintain 'test coverage'. So what happens is that as application requirements change or bugs are discovered, workarounds are developed so that the existing classes and their unit tests, leading to ugly code and meaningless unit tests.

BDD offers a way that allows us to have the benefits of TDD, without the tight coupling of code and test that TDD encourages.

Another benefit is the possibility to extend a test scenario beyond unit tests to acceptance tests.

Let's say we have an insurance quoting web application and we want to test premium calculation code. We write a feature that describes a number of premium calculation scenarios, and make sure our calculation class works. 

Once we've implemented a web application that uses that class, it would be great to use the same scenario definition to demonstrate that the web application has correctly integrated the premium calculation class. We can do this by writing a different set of step definitions that instead drive a web application.