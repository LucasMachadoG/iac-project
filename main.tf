resource "aws_s3_bucket" "s3_bucket" {
  bucket = "iac-bucket-aws"

  tags = {
    Name = "Fisrt bucket"
    iac = true
  }

  
}
