output "endpoint" {
  value = aws_db_instance.rds_db.*.endpoint
}

output "identifier" {
  value = aws_db_instance.rds_db.*.identifier
}

output "rds_sg" {
  value = aws_security_group.rds_db.id
}


