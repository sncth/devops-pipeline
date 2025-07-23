resource "aws_s3_bucket" "model-artifacts" {
  bucket = "model-artifacts"

  tags = {
    Name        = "MLOps Model Artifacts"
    Environment = "Dev"
  }
}