output "arn" {
  description = "The ARN assigned by AWS for this user"
  value       = aws_iam_user.jayaworld-iam-user.arn
}

output "name" {
  description = "The user's name"
  value       = aws_iam_user.jayaworld-iam-user.name
}

output "unique_id" {
  description = "The unique ID assigned by AWS"
  value       = aws_iam_user.jayaworld-iam-user.unique_id
}

output "iam_user_password" {
  description = "The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import."
  value       = aws_iam_user_login_profile.jayaworld-iam-login-profile.encrypted_password
}

output "iam_user_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password. Only available if password was handled on Terraform resource creation, not import."
  value       = aws_iam_user_login_profile.jayaworld-iam-login-profile.key_fingerprint
}

output "create_date" {
  description = "Date and time in RFC3339 format that the access key was created"
  value       = aws_iam_access_key.jayaworld-iam-access-key.create_date
}

output "encrypted_secret" {
  description = "Encrypted secret, base64 encoded, if pgp_key was specified. This attribute is not available for imported resources. The encrypted secret may be decrypted using the command line, for example: terraform output -raw encrypted_secret | base64 --decode | keybase pgp decrypt"
  value       = aws_iam_access_key.jayaworld-iam-access-key.encrypted_secret
}

output "encrypted_ses_smtp_password_v4" {
  description = "Encrypted SES SMTP password, base64 encoded, if pgp_key was specified. This attribute is not available for imported resources. The encrypted password may be decrypted using the command line, for example: terraform output -raw encrypted_ses_smtp_password_v4 | base64 --decode | keybase pgp decrypt."
  value       = aws_iam_access_key.jayaworld-iam-access-key.encrypted_ses_smtp_password_v4
}

output "id" {
  description = "Access key ID."
  value       = aws_iam_access_key.jayaworld-iam-access-key.id
}

output "key_fingerprint" {
  description = "Fingerprint of the PGP key used to encrypt the secret. This attribute is not available for imported resources"
  value       = aws_iam_access_key.jayaworld-iam-access-key.key_fingerprint
}

output "secret" {
  description = "Secret access key. This attribute is not available for imported resources. Note that this will be written to the state file. If you use this, please protect your backend state file judiciously. Alternatively, you may supply a pgp_key instead, which will prevent the secret from being stored in plaintext, at the cost of preventing the use of the secret key in automation."
  value       = aws_iam_access_key.jayaworld-iam-access-key.secret
}

output "iam_user_inline_policy_id" {
  description = "The user policy ID, in the form of user_name:user_policy_name"
  value       = aws_iam_user_policy.jayaworld-iam-user-policy.id
}

output "iam_user_inline_policy_name" {
  description = "The name of the policy (always set)."
  value       = aws_iam_user_policy.jayaworld-iam-user-policy.name
}