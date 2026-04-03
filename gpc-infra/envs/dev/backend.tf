terraform {
  backend "gcs" {
    bucket  = "exalate-project-492211-tfstate"
    prefix  = "dev"
  }
}
