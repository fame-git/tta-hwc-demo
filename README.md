# TTA-HWC Demo

This demo will walked you through the implementation approach of 3-tier architecture.

## Checklist

- [ x ] Init Repository
- [] Design Infra
- [] Modules Implementation
  - [x] vpc
  - [x] subnet
  - [x] vpc-route
  - [x] security-group
  - [x] security-group-rule
  - [x] vm
  - [] database
  - [] load balancer 
  - [x] eip
  - [x] enterprise_project
  - [x] kms
- [] Verify

## Implementation

### Planning Phase (Design, List Resources)

In design phase, we planned for the 3-tier layer which will aligned in:
vpc, 3 subnet (outer, middle, inner), eip, loadbalancer, 3 computer resources (2 vm, 1 db),
security. In addition, outer resources configuration are aligned with mentioned resources.

### Modules Practice

To create reuseable module, I will strict to terraform practice which each individual module will 
contains main.tf, version.tf, variables.tf, outputs.tf . Moreover, for simplicity, I will test all modules in real environment.

I will normally, read through provider doc first, and start with variables.tf to start on design input along with target resource argument.

### Power of Workspace

In some senses, when we want to work in scenarios like sit, uat which requried identical resource, but not the same amount, applied terraform workspace, allow to distinguish the state like prod, uat so that we can applied multiple tfvars along with same resources

```sh
# Design identical moultiple env (In this case dev and prod)
# Run workspace list see the current workspace (should be default)
terraform workspace list

# Create workspace dev and prod
terraform workspace new (dev/prod)

# Switch between workspace
terraform workspace select (dev/prod)

# Right now you will have multiple state dev and prod
```

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
- finish based line resource module
- decided not to use route table due to weird behavior and seems only route its fine.
- decided to strict to normal elb, eip
- I also do validation for input, but due to time and the configuration gathering practice, so no val.
- try use cases on workspace
- add some based tf resource

Record ``` 12-1-2025 ```
- Add kms module for server side encryption, and add sub module in vm, loadbalancer, eip
- Rethink on 3-tier requirement structure

## Reference

1. [Huawei Cloud Terraform Provider](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs) : Official Terraform Provider