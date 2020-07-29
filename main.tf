provider "aws" {}

terraform {
    backend "s3" {
        bucket = "msel-ops-terraform-statefiles"
        key = "ops/infrastructure/abac-policies"
    }
}

resource "aws_iam_policy" "abac" {
    name = format("ABAC_Limited_Services")
    policy = file("${path.module}/files/abac-policy.json")
}