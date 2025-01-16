# TTA-HWC Demo

This demo will walked you through the implementation approach of 3-tier architecture.

## Checklist

- [x] Init Repository
- [x] Design Infra
- [x] Modules Implementation
  - [x] vpc
  - [x] subnet
  - [x] vpc-route
  - [x] security-group
  - [x] security-group-rule
  - [x] vm
  - [x] database
  - [x] nat-gateway
  - [x] eip
  - [x] enterprise_project
  - [x] kms
- [ ] Verify

## Implementation

### Planning Phase (Design, List Resources)

In design phase, we planned for the 3-tier layer which will aligned in:
vpc, 3 subnet (outer, middle, inner), eip, nat, 3 compute resources (2 vm, 1 db),
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
### Configuration Design
In terms of infrastructure, naming the resource is crucial, bcoz, it is gonna be up there for so long, so standard naming for individual resource will enhance traceability for admin, the CIDR block of resource, config of compute instance in vm, database

```Naming convention```: project-name + environment + resource + index(if it multiple or naming)

```sh
# Enterprise project ID
name = tta

# VPC config
name = tta-dev-vpc
cidr = 10.0.0.0/16

# Subnet config
# Subnet-frontend
name = tta-dev-subnet-front
cidr = 10.0.0.0/24

# Subnet-backend
name = tta-dev-subnet-back
cidr = 10.0.0.0/22

# Subnet-db
name = tta-dev-subnet-db
cidr = 10.0.1.0/24

# KMS
key_alias = tta-dev-kms-key

# Security Group
sg_front = tta-dev-sg-front
sg_back = tta-dev-sg-back
sg_db = tta-dev-sg-db

# VM
frontend_vm = [
  name = "tta-dev-vm-front"
  spec = "s3.small.1"
  image = "CentOS 8.2 64bit"
  storage = "SAS", 40
]

backend_vm = [
  name = "tta-dev-vm-back"
  spec = "s3.small.1"
  image = "CentOS 8.2 64bit"
  storage = "SAS", 40
]
```
### Run step

Command for running
```sh
# Init every time add new module
terraform init

# FMT for linting
terraform fmt

# Apply multiple ENV
terraform apply -var-file=$PATH/$(your_tfvars_file)
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
- add some potential config
- test some based line resource on infra
- add Run step section
- ```found painpoint of my approach``` but will make wrong to right

Record ``` 16-1-2025 ```
- Try new approach on new module
- redesign, decide the new module, used nat, instead of elb
- redesign, security group rule
- redesign, vpc route
- learn another things, sometime data source, is important, but to late will improve later

## Reference

1. [Huawei Cloud Terraform Provider](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs) : Official Terraform Provider