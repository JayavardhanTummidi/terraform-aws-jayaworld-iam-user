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

# For adding users to the groups - create group membership resources
resource "aws_iam_user_group_membership" "jayaworld-iam-group-membership" {
    user = aws_iam_user.jayaworld-iam-user.name
    groups = var.iam_groups
}