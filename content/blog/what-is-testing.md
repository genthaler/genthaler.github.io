---
{
  "type": "blog",
  "author": "Günther Enthaler",
  "title": "What is testing?",
  "description": "Some thoughts on the classification and practise of testing",
  "image": "/images/article-covers/hello.jpg",
  "published": "2007-04-01"
}
---

## What do we mean by testing?

> verify that the system does what it's supposed to do

Do we mean "what the customer asked for"? What if there are multiple customers?
Do we mean "What the customer expects" There might have been plenty of off-the-cuff discussions.
There could be multiple levels of user; customer, business, support.
Verification is actually a somewhat broader than testing. Testing is generally understood to be an active process. E.g. running a unit test, or running a manual test script. 
But verification also includes things like formal modeling, 



## What kinds of testing are there?

### Unit
- executable code 
- pre-post-invariant state

- In OOP, this is usually at the class level.

### Integration testing

- Test interactions between components.  
- Not particularly well defined whether between code artefacts or between subsystems  

### System testing

- Testing the application from the users POV.  
- Ideally it should exercise all the functions of the system.  

### End-to-end testing

- System testing follows some business process that exercises the system from data input to output.  
- It usually will not exercise all functions of the system, but should exercise all subsystems and external interfaces.  

### Installation
To verify that the installation of a system or a part of a system can be performed successfully.

### Upgrade/patch testing
To verify that an upgrade to the system doesn't lose information.

### Smoke testing

- A small subset of end-to-end tests

### Performance & Load
To validate that a system can handle acceptable throughput and load and that operations are performed within defined timeframes.

### Response Times
To validate that the system responds in a timely manner during usual operation.

### Integration
To validate that a system or a number of systems integrate/communicate effectively.

### Installation
To verify that the installation of a system or a part of a system can be performed successfully.

### Upgrade/patch testing
To verify that an upgrade to the system doesn't lose information.

### Rollback testing
To verify that a rollback to the system results in a system where any data that was available prior to the upgrade is still available, and optionally and data entered since the upgrade is also available in the rolled-back systm

### Environment
To verify that an application performs as expected under all supported environments.

### Security
To verify that the system is secure and robust when an 'attacker' attempts to misuse or abuse the system.

### Regression
To verify that existing system functionality is not adversely affected by new features and/or changes to the system.

### User Acceptance Testing (UAT)

- Testing that is not executed by the development team
- In a corporate environment, this will often be executed by a dedicated testing team.  
- This testing is usually performed in a production-like environment  

### Business Acceptance Testing (BAT)

- UAT that is performed on the system after deployment to the production environment.  
- This will usually be performed by the business (not testers)  

## What are the different types of testing we perform?

- Unit
- System
- Integration?

- Regression

## What do we mean by unit testing, and what function(s) does it and should it perform?

### Reasons for unit testing

- As a guide for coding (TDD)
- To provide a basis for refactoring
- It's faster than manual testing after the 2nd or 3rd time
- It's much faster than deploying to a container
- It's a convenient harness for exploratory development
- To ensure code works for a 'reasonable' dataset
- To document the intent of the code
- To document a contract (DBC by UT)
- To 'get coverage'

### What do we do it for?
- ...

## What is Test-Driven Development (TDD)? Do we do it? Should we do it?
- AKA Test-first development
- red-green-refactor
- DRY
- YAGNI

## How do we improve our testing?

### Customer feedback

### CI feedback

## How could we improve our testing

### Exploratory testing
Manual, intuition based; though I have read of some structured approaches to this sort of testing. If a company has dedicated testers, this is what they should be doing.

### Measurement
- CI results over time
- We have our sprint presentations stats, but we don't really action them, or continuously monitor trends
  - We do have some visibility in release retros
- SonarCube?

### Code coverage
- Implement code coverage, use the results to do better testing around those areas that aren't currently well covered.
- Also identify unused code.

### Design by Contract (DBC)

- A kind of unit test, certainly executed at the unit test level of granularity  
- Testing at this level tests interactions between functions and instance vars, specifically against some contract.  
- Such a contract may be defined using some DSL that can be executed as part of the tests, part of normal execution or both.  

### Property-based or Fuzz testing

This approach is based on generating 'random' data to be applied to the application. This approach also encapsulates edge case detection, re-runnability, shrinking.

### Mutation testing  

A technology used to check the completeness of a suite of unit tests.

### Formal verification
Use of proof systems to formally verify the behaviour of code

### Code quality
- There is an argument that 'better' code should be equivalent to less buggy code.
- Various plugins (PMD, CPD)
- Red-green-refactor

## What is Behaviour-Driven Development (BDD)

- Specification by Example
- Acceptance Test-Driven Development

- It's important when discussing requirements, that everyone speaks from a common vocabulary..
- Also need to avoid ambiguity.
- Build the right thing (BDD) vs. build the thing right (TDD)


## Glossary

http://www.aptest.com/glossary.html


