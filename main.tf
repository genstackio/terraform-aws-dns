resource "aws_route53_delegation_set" "primary" {
  reference_name = "primary"
}

resource "aws_route53_zone" "zone" {
  name              = "${var.zone}."
  delegation_set_id = aws_route53_delegation_set.primary.id
  comment           = (null != var.comment) ? var.comment : "${var.name} zone"
}

resource "aws_route53_record" "statics" {
  for_each = { for record_name, record in local.entries : record_name => record if((record.env == null) || (record.env == var.name) || (record.env == "*")) }
  zone_id  = aws_route53_zone.zone.id
  name     = each.value.name
  type     = "ALIAS" == each.value.type ? "A" : each.value.type
  ttl      = each.value.ttl
  records  = "ALIAS" == each.value.type ? null : split(";;;", each.value.value)
  dynamic "alias" {
    for_each = "ALIAS" == each.value.type ? { k: 1} : {}
    content {
        name                   = split(":", each.value.value)[0]
        zone_id                = split(":", each.value.value)[1]
        evaluate_target_health = false
    }
  }
}