provider "aws" {
    region = var.region
}

# For IAM user creation 
resource "aws_iam_user" "jayaworld-iam-user" {
    name = var.iam_user_name
    path = "/"
    permissions_boundary = var.iam_user_boundary_policy_arn
    force_destroy = var.force_destroy
    tags = merge(var.tags)
}