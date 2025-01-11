# TTA-HWC Demo

This demo will walked you through the implementation approach of 3-tier architecture.

## Checklist

- [ x ] Init Repository
- [  ] Design Infra
- [  ] Modules Implementation
  - [ x ] vpc
  - [ x ] subnet
  - [  ] vpc-route-table
  - [  ] vpc-route
  - [  ] security-group
  - [  ] security-group-rule
  - [  ] vm
  - [  ] database
  - [  ] load balancer 
  - [ x ] enterprise_project
- [  ] Verify

## Implementation

### Planning Phase (Design, List Resources)

In design phase, we planned for the 3-tier layer which will aligned in:
vpc, 3 subnet (outer, middle, inner), eip, loadbalancer, 3 computer resources (2 vm, 1 db),
security. In addition, outer resources configuration are aligned with mentioned resources.

### Modules Practice

To create reuseable module, I will strict to terraform practice which each individual module will 
contains main.tf, version.tf, variables.tf, outputs.tf . Moreover, for simplicity, I will test all modules in real environment.

I will normally, read through provider doc first, and start with variables.tf to start on design input along with target resource argument.

## Noted
Record ``` 10-1-2025 ``` 
- Design Draft Currently on A4 paper
- Pick basedline 3-tier resources corresponding with timeframe
- Init git repo
- Add License
- Draft README, LICENSE
- List potential resources
- add .gitignore

Record ``` 11-1-2025 ```
- Implement module
- Normally, ```I will add doc for individual module, if interested in, we can discussed my full best practices later```.
- Found something interest in Enterprise Project Service resource, decided to use it.
- finish module vpc, subnet, enterprise_project_id, vpc-route
- decide not to use route table due to weird behavior and seems only route its fine.

## Reference

1. [Huawei Cloud Terraform Provider](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs) : Official Terraform Provider