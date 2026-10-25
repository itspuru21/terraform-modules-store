locals {
  create = var.create
}

################################################################################
# Security Group
################################################################################
resource "aws_security_group" "this" {
  count = local.create ? 1 : 0

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    { "Name" = var.name },
    var.tags
  )
}

################################################################################
# Ingress (Inbound) Rules
################################################################################
resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = local.create ? var.ingress_rules : {}

  security_group_id            = aws_security_group.this[0].id
  description                  = each.value.description
  from_port                    = each.value.from_port
  to_port                      = each.value.to_port
  ip_protocol                  = each.value.ip_protocol
  cidr_ipv4                    = each.value.cidr_ipv4
  cidr_ipv6                    = each.value.cidr_ipv6
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.referenced_security_group_id
  tags                         = each.value.tags
}

################################################################################
# Egress (Outbound) Rules
################################################################################
resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = local.create ? var.egress_rules : {}

  security_group_id            = aws_security_group.this[0].id
  description                  = each.value.description
  from_port                    = each.value.from_port
  to_port                      = each.value.to_port
  ip_protocol                  = each.value.ip_protocol
  cidr_ipv4                    = each.value.cidr_ipv4
  cidr_ipv6                    = each.value.cidr_ipv6
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.referenced_security_group_id
  tags                         = each.value.tags
}

################################################################################
# Exclusive Rules Enforcement
################################################################################
resource "aws_vpc_security_group_rules_exclusive" "this" {
  count = local.create && var.enable_exclusive_rules ? 1 : 0

  security_group_id = aws_security_group.this[0].id
  ingress_rule_ids  = [for rule in aws_vpc_security_group_ingress_rule.this : rule.id]
  egress_rule_ids   = [for rule in aws_vpc_security_group_egress_rule.this : rule.id]
}
