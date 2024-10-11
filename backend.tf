terraform {
  backend "s3" {
    bucket = "sonlh-tf-file"
    key    = "tfstate"
    region = "us-east-1"
  }
}
