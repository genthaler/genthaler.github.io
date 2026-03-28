---
{
  "type": "blog",
  "author": "Günther Enthaler",
  "title": "Defect reporting and resolving",
  "description": "An effective strategy for improving response to customer-reported bugs and reducing regression",
  "image": "/images/article-covers/hello.jpg",
  "published": "2007-04-02"
}
---

# Reducing rework

At one time I worked in an environment where there was a drive to reduce rework coming out of defect resolution.

That is, defects were being marked as resolved by the developer but re-opened by business, in some cases with identical behaviour to the original defect.

It was identified that some developers were making changes to code and not testing against all facets of the defect. On some occasions code was checked in without any testing at all...

To address this, developers were required to record a screencast of the defect, and a screencast of the defect being resolved. The business users were encouraged to view those screencasts.

Rework disappeared virtually overnight.

In time, the business were sufficiently enthusiastic about the process that they took on the recording of the defect themselves.

This also greatly reduced the amount of time required to analyse a defect; instead of having to keep going back to the business, the defect analyst had all the information they needed, much more than could be captured in a typical set of screenshots.