variable "name" {
  type = string
  description = "Name of this configuration (not database name)"
}

variable "database_plan" {
  type = string
  description = "Heroku database plan"
}

variable "region" {
  type = string
  description = "Heroku region"
  default = "us"
}

variable "organization" {
  type = string
  description = "Heroku team"
  default = ""
}

variable "personal" {
  type = bool
  description = "Is this a personal app?"
  default = true
}
