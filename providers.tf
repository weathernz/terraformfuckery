provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      CreationDate = "2022-11-03"
      CreatedBy    = "Simon"
      Comment      = "today is the day to vote"
    }
  }
}