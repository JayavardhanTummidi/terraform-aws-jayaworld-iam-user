output "arn" {
    description = "The ARN assigned by AWS for this user"
    value = aws_iam_user.jayaworld-iam-user.arn
}

output "name" {
    description = "The user's name"
    value = aws_iam_user.jayaworld-iam-user.name 
}

output "unique_id" {
    description = "The unique ID assigned by AWS"
    value = aws_iam_user.jayaworld-iam-user.unique_id 
}

output "iam_user_password" {
    description = "The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import."
    value = aws_iam_user_login_profile.jayaworld-iam-login-profile.encrypted_password
}

output "iam_user_key_fingerprint" {
    description = "The fingerprint of the PGP key used to encrypt the password. Only available if password was handled on Terraform resource creation, not import."
    value = aws_iam_user_login_profile.jayaworld-iam-login-profile.key_fingerprint
}