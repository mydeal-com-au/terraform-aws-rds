resource "random_string" "rds_db_password" {
  length  = 34
  special = false
}

resource "aws_db_instance" "rds_db" {
  count                   = var.db_type == "rds" ? 1 : 0
  allocated_storage       = var.allocated_storage
  storage_type            = "gp2"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  name                    = var.name
  backup_retention_period = var.retention
  identifier              = var.identifier == "" ? "${var.environment_name}-${var.name}" : var.identifier
  username                = var.user
  password                = random_string.rds_db_password.result
  parameter_group_name    = var.parameter_group_name
  db_subnet_group_name    = try(aws_db_subnet_group.rds_subnet_group[0].id, var.db_subnet_group_id)
  vpc_security_group_ids  = [aws_security_group.rds_db.id]
  apply_immediately       = var.apply_immediately
  skip_final_snapshot     = var.skip_final_snapshot
  snapshot_identifier     = var.snapshot_identifier != "" ? var.snapshot_identifier : null
  kms_key_id              = var.kms_key_arn
  storage_encrypted       = var.storage_encrypted
  tags = {
    Backup = var.backup
  }
}