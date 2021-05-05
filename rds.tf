resource "random_string" "rds_db_password" {
  length  = 34
  special = false
}

resource "aws_db_instance" "rds_db" {
  allocated_storage       = var.allocated_storage
  storage_type            = "gp2"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  name                    = var.name
  backup_retention_period = var.retention
  identifier              = "${var.environment_name}-${var.name}"
  username                = var.user
  password                = random_string.rds_db_password.result
  parameter_group_name    = var.parameter_group_name
  db_subnet_group_name    = var.db_subnet_group_id
  vpc_security_group_ids  = list(aws_security_group.rds_db.id)
  apply_immediately       = var.apply_immediately
  skip_final_snapshot     = true
  snapshot_identifier     = var.snapshot_identifier != "" ? var.snapshot_identifier : null
  kms_key_id              = var.kms_key_arn
  storage_encrypted       = var.storage_encrypted
  tags = {
    Backup = var.backup
  }
}
