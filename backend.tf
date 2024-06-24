terraform {
  backend "s3" {
    bucket         = "reggie-talent-academy-686520628199-tfstates"
    key            = "uds/uds-core-project/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}