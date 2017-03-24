resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-20170323"
    acl = "private"

    tags {
        Name = "Terraform state"
    }
}
