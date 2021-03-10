# AWS Route53 Root DNS Terraform module

Terraform module which creates route53 root dns records on AWS.

## Usage

```hcl
module "dns-root" {
  source     = "genstackio/dns/aws//modules/root"

  // ...
}
```
