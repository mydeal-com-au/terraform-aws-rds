# terraform-aws-rds

[![Lint Status](https://github.com/DNXLabs/terraform-aws-rds/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-rds/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-rds)](https://github.com/DNXLabs/terraform-aws-rds/blob/master/LICENSE)

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocated\_storage | Storage size in GB | `number` | `null` | no |
| allow\_cidrs | List of CIDRs to allow connection to this DB | `list(string)` | `[]` | no |
| allow\_security\_group\_ids | List of Security Group IDs to allow connection to this DB | `list(string)` | `[]` | no |
| apply\_immediately | Apply changes immediately or wait for the maintainance window | `bool` | `true` | no |
| backup | Enables automatic backup with AWS Backup | `bool` | n/a | yes |
| cluster\_parameters | A list of Cluster parameters (map) to apply | `list(map(string))` | `[]` | no |
| count\_aurora\_instances | Number of Aurora Instances | `number` | `"1"` | no |
| create\_cluster\_parameter\_group | Whether to create a cluster parameter group | `bool` | `false` | no |
| create\_db\_option\_group | (Optional) Create a database option group | `bool` | `false` | no |
| create\_db\_parameter\_group | Whether to create a database parameter group | `bool` | `false` | no |
| create\_db\_subnet\_group | Create a Subnet group? | `bool` | `false` | no |
| database\_name | Database Name | `string` | `""` | no |
| db\_parameters | A list of DB parameters (map) to apply | `list(map(string))` | `[]` | no |
| db\_subnet\_group\_id | RDS Subnet Group Name | `string` | n/a | yes |
| db\_subnet\_group\_subnet\_ids | List of Subnet IDs for the RDS Subnet Group | `list(any)` | `[]` | no |
| db\_type | Valid values are: rds, aurora or serverless | `string` | n/a | yes |
| deletion\_protection | The database can't be deleted when this value is set to true. | `bool` | `false` | no |
| enabled\_cloudwatch\_logs\_exports | (Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine) | `any` | `null` | no |
| engine | n/a | `string` | n/a | yes |
| engine\_version | n/a | `string` | `""` | no |
| environment\_name | Environment name to use as a prefix to this DB | `string` | n/a | yes |
| family | The family of the DB parameter group | `string` | `""` | no |
| iam\_database\_authentication\_enabled | n/a | `bool` | `false` | no |
| identifier | Optional identifier for DB. If not passed, {environment\_name}-{name} will be used | `string` | `""` | no |
| instance\_class | n/a | `string` | n/a | yes |
| kms\_key\_arn | KMS Key ARN to use a CMK instead of default shared key, when storage\_encrypted is true | `string` | `""` | no |
| license\_model | License Model | `string` | `""` | no |
| major\_engine\_version | Specifies the major version of the engine that this option group should be associated with | `string` | `""` | no |
| max\_allocated\_storage | Argument higher than the allocated\_storage to enable Storage Autoscaling, size in GB. 0 to disable Storage Autoscaling | `number` | `0` | no |
| multi\_az | Deploy multi-az instance database | `bool` | `false` | no |
| name | Name of this RDS Database | `string` | n/a | yes |
| option\_group\_description | The description of the option group | `string` | `"Managed by Terraform"` | no |
| option\_group\_name | Name of the option group | `string` | `null` | no |
| option\_group\_use\_name\_prefix | Determines whether to use `option_group_name` as is or create a unique name beginning with the `option_group_name` as the prefix | `bool` | `true` | no |
| option\_name | (Required) The Name of the Option | `string` | `""` | no |
| options | A list of Options to apply. | `any` | `[]` | no |
| parameter\_group\_description | The description of the DB parameter group | `string` | `"Managed by Terraform"` | no |
| parameter\_group\_name | Name of the DB parameter group to associate or create | `string` | `null` | no |
| performance\_insights\_enabled | Enable performance insights on instance | `bool` | `false` | no |
| port | Port number for this DB (usually 3306 for MySQL and 5432 for Postgres) | `number` | n/a | yes |
| preferred\_backup\_window | Preferred Backup Window | `string` | `"07:00-09:00"` | no |
| publicly\_accessible | (Optional) Bool to control if instance is publicly accessible | `bool` | `false` | no |
| retention | Snapshot retention period in days | `number` | n/a | yes |
| secret\_method | Use ssm for SSM parameters store which is the default option, or secretsmanager for AWS Secrets Manager | `string` | `"ssm"` | no |
| skip\_final\_snapshot | Skips the final snapshot if the database is destroyed programatically | `bool` | `false` | no |
| snapshot\_identifier | Pass a snapshot identifier for the database to be created from this snapshot | `string` | `""` | no |
| storage\_encrypted | Enables storage encryption | `bool` | n/a | yes |
| user | DB User | `string` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | n/a |
| identifier | n/a |
| rds\_sg | n/a |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE) for full details.