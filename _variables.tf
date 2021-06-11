variable "name" {
  type        = string
  description = "Name of this RDS Database"
}

variable "environment_name" {
  type        = string
  description = "Environment name to use as a prefix to this DB"
}

variable "db_type" {
  type        = string
  description = "Valid values are: rds, aurora or serverless"
}

variable "iam_database_authentication_enabled" {
  type    = bool
  default = false
}

variable "allow_security_group_ids" {
  type        = list(string)
  description = "List of Security Group IDs to allow connection to this DB"
  default     = []
}

variable "allow_cidrs" {
  type        = list(string)
  default     = []
  description = "List of CIDRs to allow connection to this DB"
}

variable "user" {
  type        = string
  description = "DB User"
}

variable "retention" {
  type        = number
  description = "Snapshot retention period in days"
}

variable "instance_class" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type    = string
  default = ""
}

variable "port" {
  type = number
  description = "Port number for this DB (usually 3306 for MySQL and 5432 for Postgres)"
}

variable "parameter_group_name" {
  type = string
  description = "Parameter group name for this DB"
}

variable "apply_immediately" {
  type    = bool
  default = true
  description = "Apply changes immediately or wait for the maintainance window"
}

variable "skip_final_snapshot" {
  type    = bool
  default = false
  description = "Skips the final snapshot if the database is destroyed programatically"
}


variable "snapshot_identifier" {
  type    = string
  default = ""
  description = "Pass a snapshot identifier for the database to be created from this snapshot"
}

variable "identifier" {
  type    = string
  default = ""
  description = "Optional identifier for DB. If not passed, {environment_name}-{name} will be used"
}

variable "database_name" {
  description = "Database Name"
  type        = string
  default     = ""
}


variable "allocated_storage" {
  type        = number
  description = "Storage size in GB"
  default     = null
}

variable "storage_encrypted" {
  type        = bool
  description = "Enables storage encryption"
}

variable "kms_key_arn" {
  type        = string
  default     = ""
  description = "KMS Key ARN to use a CMK instead of default shared key, when storage_encrypted is true"
}

variable "backup" {
  type        = bool
  description = "Enables automatic backup with AWS Backup"
}

variable "vpc_id" {
  type = string
}

variable "db_subnet_group_id" {
  description = "RDS Subnet Group Name"
  type        = string
}


variable "db_subnet_group_subnet_ids" {
  type        = list(any)
  description = "List of Subnet IDs for the RDS Subnet Group"
  default     = []
}

variable "preferred_backup_window" {
  description = "Preferred Backup Window"
  type        = string
  default     = "07:00-09:00"
}

variable "count_aurora_instances" {
  description = "Number of Aurora Instances"
  type        = number
  default     = "1"
}
