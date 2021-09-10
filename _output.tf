output "endpoint" {
  value = try(aws_db_instance.rds_db[0].endpoint, "")
}

output "identifier" {
  value = try(aws_db_instance.rds_db[0].identifier, "")
}

output "rds_sg" {
  value = aws_security_group.rds_db.id
}