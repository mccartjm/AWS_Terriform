
resource "aws_iam_role" "run_prowler" {
  name = "run_prowler"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# resource "aws_lambda_function" "run_prowler" {
#   filename         = "./prowler"
#   function_name    = "run_prowler"
#   role             = "${aws_iam_role.run_prowler.arn}"
#   handler          = "lambda_function.lambda_handler"
#   source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
#   runtime          = "python2.7"
# }

# resource "aws_iam_role_policy_attachment" "lambda_logs" {
#   role = "${aws_iam_role.run_prowler.name}"
#   policy_arn = "${aws_iam_policy.lambda_logging.arn}"
# }
