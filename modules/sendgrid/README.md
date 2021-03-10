# AWS Route53 Sendgrid DNS Terraform module

Terraform module which creates route53 sendgrid dns records on AWS.

## Usage

```hcl
module "dns-sendgrid" {
  source     = "genstackio/dns/aws//modules/sendgrid"

  // ...
}
```
