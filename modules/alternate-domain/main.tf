module "dns" {
  source       = "../.."
  zone         = var.domain
  name         = "alternate"
  comment      = "Alternate domain to ${var.target}"
  statics_file = var.statics_file
}

module "dns-google" {
  source               = "../google"
  zone                 = module.dns.zone
  site_verification_id = var.domain_google_site_verification_id
}

resource "aws_route53_record" "apex" {
  zone_id = module.dns.zone
  name    = var.domain
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.alternate.website_domain
    zone_id                = aws_s3_bucket.alternate.hosted_zone_id
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "www" {
  zone_id = module.dns.zone
  name    = "www.${var.domain}"
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.alternate-www.website_domain
    zone_id                = aws_s3_bucket.alternate-www.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_s3_bucket" "alternate" {
  bucket = var.domain
}
resource "aws_s3_bucket_website_configuration" "alternate" {
  bucket = aws_s3_bucket.alternate.id
  redirect_all_requests_to {
    host_name = var.target
  }
}
resource "aws_s3_bucket" "alternate-www" {
  bucket = "www.${var.domain}"
}
resource "aws_s3_bucket_website_configuration" "alternate-www" {
  bucket = aws_s3_bucket.alternate-www.id
  redirect_all_requests_to {
    host_name = var.target
  }
}
