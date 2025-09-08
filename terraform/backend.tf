########################################
# Set Backend to S3
########################################

# Backend attributes are read from backend.cnf

terraform {

  backend "s3" {
    bucket         = "placeholder-bucket"
    use_lockfile   = "placeholder-use-lockfile"
    key            = "placeholder-key"
    region         = "placeholder-region"
    encrypt        = "placeholder-encrypt"
  }

}
