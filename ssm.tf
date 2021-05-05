resource "aws_ssm_parameter" "rds_db_password" {
  name        = "/rds/${var.environment_name}-${var.name}/PASSWORD"
  description = "RDS Password"
  type        = "SecureString"
  value       = random_string.rds_db_password.result

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "rds_db_user" {
  name        = "/rds/${var.environment_name}-${var.name}/USER"
  description = "RDS User"
  type        = "SecureString"
  value       = aws_db_instance.rds_db.username
}

resource "aws_ssm_parameter" "rds_endpoint" {
  name        = "/rds/${var.environment_name}-${var.name}/ENDPOINT"
  description = "RDS Endpoint"
  type        = "String"
  value       = aws_db_instance.rds_db.endpoint
}

resource "aws_ssm_parameter" "rds_db_address" {
  name        = "/rds/${var.environment_name}-${var.name}/HOST"
  description = "RDS Hostname"
  type        = "String"
  value       = aws_db_instance.rds_db.address
}

resource "aws_ssm_parameter" "rds_db_name" {
  name        = "/rds/${var.environment_name}-${var.name}/NAME"
  description = "RDS DB Name"
  type        = "String"
  value       = aws_db_instance.rds_db.name
}
