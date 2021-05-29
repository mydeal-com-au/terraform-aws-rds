resource "aws_rds_cluster" "aurora_cluster" {
  count = "${var.db_type == "aurora" ? 1 : 0}"
  cluster_identifier      = var.identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  #availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = var.database_name
  master_username         = var.user
  master_password         = random_string.rds_db_password.result
  backup_retention_period = var.retention
  preferred_backup_window = var.preferred_backup_window
  snapshot_identifier     = var.snapshot_identifier != "" ? var.snapshot_identifier : null
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.id
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count = "${var.db_type == "aurora" ? 2 : 0}"
  identifier         = "${var.identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora_cluster[0].id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.aurora_cluster[0].engine
  engine_version     = aws_rds_cluster.aurora_cluster[0].engine_version
}
