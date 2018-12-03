# Create a Heroku pipeline
resource "heroku_pipeline" "apptrain" {
  name = "apptrain"
}

# Couple apps to different pipeline stages
resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.apptrain.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.apptrain.id}"
  stage    = "production"
}
