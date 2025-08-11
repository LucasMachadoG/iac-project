terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }

  // Como o terraform n permite colocar variaveis aq, vai ter que mudar na mão para o workspace correto
  // Aqui estamos apenas dizendo ao terraform que queremos salvar o nosso tfstate no nosso recurso s3 na AWS
  backend "s3" {
    bucket  = "iac-state-bucket-tf-default"
    region  = "us-east-2"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "iac-sso"
  }
}

provider "aws" {
  profile = "iac-sso"
  region  = "us-east-2"
}

// Aqui estamos fazendo a criação do nosso recurso s3 para salvar o nosso estado na nuvem
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.state_bucket}-${terraform.workspace}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.terraform_state
  ]
}