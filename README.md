> **Thanks for using Jaya world modules**

> **Example to create new IAM user with the console access and access key (API)**

module "jayaworld-iam-user" {

  source  = "app.terraform.io/jaya-world/jayaworld-iam-user/aws"
  # insert required variables here

  iam_user_name    =   "jaya-be-happy"

  pgp_key = "keybase:some_person_that_exists"    # You must install keybase in your machine to generate PGP key

  iamuser_password_length = "20"

  password_reset_required = "true"

  iam_access_key_status = "Active"

  # To reset an IAM User login password via Terraform, you can use the terraform taint command or change any of the arguments.

  # To decrypt the encrypted password using the command line, for example: terraform output password | base64 --decode | keybase pgp decrypt.

}

> **Example to create new IAM User adding it into group membership**

module "jayaworld-iam-user" {

  source  = "app.terraform.io/jaya-world/jayaworld-iam-user/aws"
  # insert required variables here

  iam_user_name    =   "jaya-be-happy"

  iam_groups              = ["group-1", "group-2"]

}

> **Example to create new IAM User with the inline policies and AWS managed policies**

module "jayaworld-iam-user" {

  source  = "app.terraform.io/jaya-world/jayaworld-iam-user/aws"
  # insert required variables here

  iam_user_name    =   "jaya-be-happy"

  user_inline_policy_name = "jw-world-policy"

  user_inline_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Action = [

          "ec2:Describe*",

        ]

        Effect   = "Allow"

        Resource = "*"

      },

    ]

  })
  
  # OR 

  user_inline_policy = file("./policy.json")
  
  # OR

  <<EOT


{
   
   
    "Version": "2012-10-17",
    

    "Statement": [

        {

            "Effect": "Allow",

            "Action": [

                "iam:GenerateCredentialReport",

                "iam:GenerateServiceLastAccessedDetails",

            ],

            "Resource": "*"
        }
    ]
}

EOT
  # AWS managed policies ARN

  user_managed_policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"

}

> **Example to create new IAM User with uploading SSH public key for AWS code commit**

module "jayaworld-iam-user" {

  source  = "app.terraform.io/jaya-world/jayaworld-iam-user/aws"
  # insert required variables here

  iam_user_name    =   "jaya-be-happy"

  encoding = "SSH"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 mytest@mydomain.com"


  status = "Active"


}