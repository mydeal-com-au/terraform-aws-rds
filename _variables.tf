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
  description = "Valid Values are: RDS/Aurora or Serverless"
}

variable "iam_database_authentication_enabled" {
  type        = bool
  default = false
}

variable "allow_security_group_ids" {
  type        = list(any)
  description = "List of Security Group IDs to allow connection to this DB"
  default     = []
}

variable "allow_cidrs" {
  type        = list(any)
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
}

variable "parameter_group_name" {
  type = string
}

variable "apply_immediately" {
  type    = bool
  default = true
}

variable "skip_final_snapshot" {
  type    = bool
  default = false
}


variable "snapshot_identifier" {
  type    = string
  default = ""
}

variable "identifier" {
  type    = string
  default = ""
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
