# AWS Route53 Ses DNS Terraform module

Terraform module which creates route53 ses dns records on AWS.

## Usage

```hcl
module "dns-ses" {
  source     = "genstackio/dns/aws//modules/ses"

  // ...
}
```
