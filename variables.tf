variable "region" {
    description = "specify region"
    type = string
    default = "us-east-1"
}

variable "iam_user_name" {
    description = "The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. User names are not distinguished by case. For example, you cannot create users named both TESTUSER and testuser"
    type = string
}

variable "iam_user_boundary_policy_arn" {
    description = "The ARN of the policy that is used to set the permissions boundary for the user"
    type = string
    default = ""
}

variable "force_destroy" {
    description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
    type = string
    default = false
}

variable "tags" {
    description = "Tags for the user"
    type = map(string)
    default = {}
}

variable "iam_groups" {
    description = "Add users to the groups"
    type = list(string)
    default = []
}