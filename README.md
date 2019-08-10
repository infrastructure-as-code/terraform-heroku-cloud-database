# Cloud Database Terraform Module

Provisions databases on the Heroku platform.


## Introduction

Have you found yourself clicking through a web console on Heroku, AWS, or another cloud provider when you need a cloud database for development or test purposes, and wishing that you had scripted the process?  This module will help you do just that by creating the cloud databases you need on Heroku.


## Usage

```
provider "heroku" {}

module "db" {
  source        = "github.com/infrastructure-as-code/terraform-heroku-database"
  name          = "<your-database-app-name>"
  database_plan = "heroku-postgresql:hobby-dev"
}

output "database_url" {
  value = "${module.db.database_url}"
}
```

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Used as the application name in Heroku. | string | - | yes |
| database\_plan | The Heroku Add-ons plan name. | string | - | yes |
| region | Heroku region | string | "us" | no |
| organization | Heroku team name, if any. | string | "" | no |
| personal | Is this a personal application on Heroku? | boolean | true | no |

### Outputs

| Name | Description |
|------|-------------|
| database\_url | The database URL |


## Heroku Database Add-ons Plans

Heroku has a range of [data store add-ons](https://elements.heroku.com/addons#data-stores) that can be used for your dev, test and production purposes.

Here is a list of selected Heroku add-ons, their respective free plans, and limitations with the free plans, to get you started.

| Add-on | Plan Name | Limitations |
|--------|-----------|-------------|
| [Heroku Postgres](https://elements.heroku.com/addons/heroku-postgresql) | `heroku-postgresql:hobby-dev` | 10,000 rows |
| [ClearDB MySQL](https://elements.heroku.com/addons/cleardb) | `cleardb:ignite` | 5mb |
| [JawsDB MySQL](https://elements.heroku.com/addons/jawsdb) | `jawsdb:kitefin` | 5mb |
| [JawsDB Maria](https://elements.heroku.com/addons/jawsdb-maria) | `jawsdb-maria:kitefin` | 5mb |
| [Heroku Redis](https://elements.heroku.com/addons/heroku-redis) | `heroku-redis:hobby-dev` | 25mb |
| [Redis Cloud](https://elements.heroku.com/addons/rediscloud) | `rediscloud:30` | 30mb |
| [Redis To Go](https://elements.heroku.com/addons/redistogo) | `redistogo:nano` | 5mb |
| [mLab MongoDB](https://elements.heroku.com/addons/mongolab) | `mongolab:sandbox` | 496mb |

## Motivations

The following is a list of pain points that the author has encountered before creating this module.

1. Time spent waiting for AWS RDS database instances to be created (and destroyed).
1. Over-provisioning of AWS RDS capacity (even with `db.t2.micro` instances) for low-traffic applications.
1. Time spent clicking through the Heroku console creating and deleting databases, and then tracking what applications they are used with.
1. Boredom, and the desire to write some code.
