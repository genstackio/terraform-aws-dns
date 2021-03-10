# AWS Route53 GitHub DNS Terraform module

Terraform module which creates route53 github dns records on AWS.

## Usage

```hcl
module "dns-github" {
  source     = "genstackio/dns/aws//modules/github"

  // ...
}
```
