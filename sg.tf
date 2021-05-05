
resource "aws_security_group" "rds_db" {
  name     = "rds-${var.environment_name}-${var.name}"
  vpc_id   = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "rds_db_inbound_cidrs" {
  count             = length(var.allow_cidrs) != 0 ? 1 : 0
  type              = "ingress"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = var.allow_cidrs
  security_group_id = aws_security_group.rds_db.id
  description       = "From CIDR ${join(", ", var.allow_cidrs)}"
}

resource "aws_security_group_rule" "rds_db_inbound_ecs" {
  count                    = length(var.allow_security_group_ids)
  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  source_security_group_id = var.allow_security_group_ids[count.index]
  security_group_id        = aws_security_group.rds_db.id
  description              = "From ECS Nodes"
}