resource "aws_iam_user" "pipeline-handler" {
  name = "pipeline-handler"
}

data "aws_iam_policy_document" "pipeline-handler-policy-document" {
  statement {
    effect    = "Allow"
    actions   = ["S3:*","ECR:*"]
    resources = [aws_s3_bucket.model-artifacts.arn,
                 "${aws_s3_bucket.model-artifacts.arn}/*",
                 aws_ecr_repository.ml-api-repo.arn]
  }
}

resource "aws_iam_user_policy" "pipeline-handler-policy" {
  name   = "pipeline-handler-policy"
  user   = aws_iam_user.pipeline-handler.name
  policy = data.aws_iam_policy_document.pipeline-handler-policy-document.json
}

resource "aws_iam_access_key" "pipeline-handler-key" {
  user = aws_iam_user.pipeline-handler.name
}