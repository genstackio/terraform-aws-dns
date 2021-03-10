# AWS Route53 Alternate Domain Terraform module

Terraform module which creates route53 alternate domain on AWS.

## Usage

```hcl
module "alternate-domain" {
  source     = "genstackio/dns/aws//modules/alternate-domain"

  // ...
}
```
