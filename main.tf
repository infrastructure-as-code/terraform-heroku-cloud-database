resource "heroku_app" "app" {
  name   = "${var.name}-db"
  region = "${var.region}"
  organization {
    name     = "${var.organization}"
    personal = "${var.personal}"
  }
}

resource "heroku_addon" "db" {
  app  = "${heroku_app.app.name}"
  plan = "${var.database_plan}"
}

# this data source reloads the Heroku app attributes
data "heroku_app" "app" {
  name   = "${var.name}-db"

  depends_on = [
    "heroku_app.app",
    "heroku_addon.db",
  ]
}

locals {
  # Assumption here is that each database add-on only has a
  # single config var.  Is that a safe assumption?
  db_var       = "${heroku_addon.db.config_vars[0]}"
  database_url = "${data.heroku_app.app.config_vars[local.db_var]}"
}
