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

# Manages an IAM User Login Profile with limited support for password creation during Terraform resource creation. Uses PGP to encrypt the password for safe transport to the user. PGP keys can be obtained from Keybase.
resource "aws_iam_user_login_profile" "jayaworld-iam-login-profile" {
    user = aws_iam_user.jayaworld-iam-user.name
    pgp_key = var.pgp_key
    password_length = var.iamuser_password_length
    password_reset_required = var.iamuser_password_reset_required
}