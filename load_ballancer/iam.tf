resource "aws_iam_policy" "ziyo_policy" {

  name = "${local.s3_prefix}_s3_access_policy"

  path = "/"

  description = "My ziyo 2023 test policy"



  policy = <<EOF
{

  "Version": "2012-10-17",

  "Statement": [

    {

      "Action": [

        "s3:*"

      ],

      "Effect": "Allow",

      "Resource": [

          "*"

      ]

    }

  ]

}

EOF

}



resource "aws_iam_role" "ziyo_role" {

  name = "s3_test_role"



  assume_role_policy = <<EOF

{

    "Version": "2012-10-17",

    "Statement": [

        {

            "Action": "sts:AssumeRole",

            "Principal": {

               "Service": "ec2.amazonaws.com"

            },

            "Effect": "Allow",

            "Sid": ""

        }

    ]

}

EOF

  tags = {

    name = "web-tier-s3-access"

  }

}



resource "aws_iam_policy_attachment" "ziyo_attach" {

  name = "ziyo-test-attachment"

  roles = [aws_iam_role.ziyo_role.name]

  policy_arn = aws_iam_policy.ziyo_policy.arn

}



resource "aws_iam_instance_profile" "ziyo_profile" {

  name = "ziyo_2023_ec2_profile"

  role = aws_iam_role.ziyo_role.name

}