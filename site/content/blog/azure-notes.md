---
title: "Microsoft Azure Notes"
date: 2019-07-29T10:14:34+08:00
draft: false
images: []
---

## Determine workload requirement

- Identifying requirements: Use cases, goals, scopes; 
- Assumptions: Are we gonna use cloud native tools or traditional ones? Use existing licenses?
- Critical Success Factors: Need to be scalable to meet xyz workload, utilizing existing operation team, no new talent required?
- Plan for growth
- Manage cost

## Complaince and security requirement

- Data protection in EU: GDPR
- Healthcare: HIPPA
- Government: FedRAMP

## SLA - Service Level Agreement

- MTTR: Mean Time To Recovery. Avg time to recover service from outage
- MTBF: Mean Time Between Failure. Avg time between outages
- RPO: Recovery Point Objective. Interval of time in which data could be lost during a recovery. E.g. 5 minute RPO means up to 5 minutes of data could be lost
- RTO: Recovery Time Objective. Time requirement for recovery to be completed in before there is business impact
- Composite SLA: SQL 99.95% x Web App 99.5% = SLA 99.94%

## Domain services

- Azure Active Directory: AAD, often the same as O365 directory service 
- Active Directory Domain Services: ADDS, legacy service, with AD installed on windows VM
- Azure Active Directory Domain Services: Managed domain services

