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
| allow\_cidrs | List of CIDRs to allow connection to this DB | `list(any)` | `[]` | no |
| allow\_security\_group\_ids | List of Security Group IDs to allow connection to this DB | `list(any)` | `[]` | no |
| apply\_immediately | n/a | `bool` | `true` | no |
| backup | Enables automatic backup with AWS Backup | `bool` | n/a | yes |
| database\_name | Database Name | `string` | `""` | no |
| db\_subnet\_group\_id | RDS Subnet Group Name | `string` | n/a | yes |
| db\_subnet\_group\_subnet\_ids | List of Subnet IDs for the RDS Subnet Group | `list(any)` | `[]` | no |
| db\_type | Valid Values are: RDS/Aurora or Serverless | `string` | n/a | yes |
| engine | n/a | `string` | n/a | yes |
| engine\_version | n/a | `string` | `""` | no |
| environment\_name | Environment name to use as a prefix to this DB | `string` | n/a | yes |
| iam\_database\_authentication\_enabled | n/a | `bool` | `false` | no |
| identifier | n/a | `string` | `""` | no |
| instance\_class | n/a | `string` | n/a | yes |
| kms\_key\_arn | KMS Key ARN to use a CMK instead of default shared key, when storage\_encrypted is true | `string` | `""` | no |
| name | Name of this RDS Database | `string` | n/a | yes |
| parameter\_group\_name | n/a | `string` | n/a | yes |
| port | n/a | `number` | n/a | yes |
| preferred\_backup\_window | Preferred Backup Window | `string` | `"07:00-09:00"` | no |
| retention | Snapshot retention period in days | `number` | n/a | yes |
| skip\_final\_snapshot | n/a | `bool` | `false` | no |
| snapshot\_identifier | n/a | `string` | `""` | no |
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