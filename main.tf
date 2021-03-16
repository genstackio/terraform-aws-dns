resource "aws_route53_delegation_set" "primary" {
  reference_name = "primary"
}

resource "aws_route53_zone" "zone" {
  name              = "${var.zone}."
  delegation_set_id = aws_route53_delegation_set.primary.id
  comment           = "${var.name} zone"
}

resource "aws_route53_record" "statics" {
  for_each = {for record_name, record in local.entries: record_name => record if ((record.env == null) || (record.env == var.name) || (record.env == "*"))}
  zone_id  = aws_route53_zone.zone.id
  name     = each.value.name
  type     = each.value.type
  ttl      = each.value.ttl
  records  = split(";;;", each.value.value)
}