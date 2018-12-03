# Configure the Heroku provider
provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_key}"
}

