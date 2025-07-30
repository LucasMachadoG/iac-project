# IAC-PROJECT

Este é um projeto de estudos sobre **Infrastructure as Code (IaC)** usando **Terraform** e **AWS**.

## Status atual

- [x] Inicialização do projeto
- [x] Configuração do provider da AWS (`providers.tf`)
- [x] Provisionamento de bucket S3 com Terraform

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }
}

provider "aws" {
  profile = "iac-sso"
  region  = "us-east-2"
}
```

## Objetivo

Explorar práticas modernas de infraestrutura como código, começando com o provisionamento de recursos na **AWS** utilizando **Terraform**.

## Recursos provisionados até agora
  * **aws_s3_bucket** – Bucket criado com nome único **(iac-bucket-aws)** para armazenar dados e servir de base para testes com Terraform.

## Tecnologias

  * Terraform
  * AWS

## Estrutura do projeto

```hcl
.
├── main.tf             # Declaração de recursos
├── providers.tf        # Configuração do provider AWS
├── terraform.tfstate   # Estado da infraestrutura (gerado automaticamente)
└── README.md
```