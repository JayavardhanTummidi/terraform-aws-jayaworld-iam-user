provider "aws" {
  region = var.region
}

# For IAM user creation 
resource "aws_iam_user" "jayaworld-iam-user" {
  name                 = var.iam_user_name
  path                 = "/"
  permissions_boundary = var.iam_user_boundary_policy_arn
  force_destroy        = var.force_destroy
  tags                 = merge(var.tags)
}

# For adding users to the groups - create group membership resources
resource "aws_iam_user_group_membership" "jayaworld-iam-group-membership" {
  user   = aws_iam_user.jayaworld-iam-user.name
  groups = var.iam_groups
}

# Manages an IAM User Login Profile with limited support for password creation during Terraform resource creation. Uses PGP to encrypt the password for safe transport to the user. PGP keys can be obtained from Keybase.
resource "aws_iam_user_login_profile" "jayaworld-iam-login-profile" {
  user                    = aws_iam_user.jayaworld-iam-user.name
  pgp_key                 = var.pgp_key
  password_length         = var.iamuser_password_length
  password_reset_required = var.iamuser_password_reset_required
}

# Provides an IAM access key. This is a set of credentials that allow API requests to be made as an IAM user
resource "aws_iam_access_key" "jayaworld-iam-access-key" {
  user    = aws_iam_user.jayaworld-iam-user.name
  pgp_key = var.pgp_key
  status  = var.iam_access_key_status
}

# Provides an IAM policy attached to a user.
resource "aws_iam_user_policy" "jayaworld-iam-user-policy" {
  user   = aws_iam_user.jayaworld-iam-user.name
  name   = var.user_inline_policy_name
  policy = var.user_inline_policy
}

# Attaches a Managed IAM Policy to an IAM user
resource "aws_iam_user_policy_attachment" "jayaworld-iam-user-managed-policy" {
  user       = aws_iam_user.jayaworld-iam-user.name
  policy_arn = var.user_managed_policy_arn
} 