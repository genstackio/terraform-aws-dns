# AWS Route53 Google DNS Terraform module

Terraform module which creates route53 google dns records on AWS.

## Usage

```hcl
module "dns-google" {
  source     = "genstackio/dns/aws//modules/google"

  // ...
}
```
