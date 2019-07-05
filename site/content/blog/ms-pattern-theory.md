---
title: "Microservices principles"
date: 2019-07-04T21:36:34+08:00
draft: false
images: []
---

## DDD

> Domain-driven design (DDD) is an approach to software development for complex needs by connecting the implementation to an evolving model. Reference: https://airbrake.io/blog/software-design/domain-driven-design

## CAP

> The CAP Theorem is a fundamental theorem in distributed systems that states any distributed system can have at most two of the following three properties. Consistency. Availability. Partition tolerance.

## ACID & BASE

- ACID
  - Atomic: Everything in a transaction succeeds or the entire transaction is rolled back.
  - Consistent: A transaction cannot leave the database in an inconsistent state.
  - Isolated: Transactions cannot interfere with each other.
  - Durable: Completed transactions persist, even when servers restart etc.

- BASE
  - Basic Availability
  - Soft-state
  - Eventual consistency

## Paxos

## Raft

## AKF Scale Cube

[scale-cube](https://akfpartners.com/growth-blog/scale-cube)

## Saga

[Saga pattern](https://microservices.io/patterns/data/saga.html)

## BFF

[Backend For Frontend](https://microservices.io/patterns/apigateway.html)

## Reference

- [Patterns for microservices](https://microservices.io/patterns/index.html, "Thanks to Chris Richardson")
