# Create a database for the staging app
resource "heroku_addon" "staging_database" {
  app  = "${heroku_app.staging.name}"
  plan = "heroku-postgresql:hobby-dev"
}

# Create a database for the production app
resource "heroku_addon" "production_database" {
  app  = "${heroku_app.production.name}"
  plan = "heroku-postgresql:hobby-dev"
}
