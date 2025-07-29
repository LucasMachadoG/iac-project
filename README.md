# IAC-PROJECT

Este é um projeto de estudos sobre **Infrastructure as Code (IaC)** usando **Terraform** e **AWS**.

## 📦 Status atual

- [x] Inicialização do projeto
- [x] Configuração do provider da AWS (`providers.tf`)

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }
}

provider "aws" {}
```

## 📚 Objetivo

Explorar práticas modernas de infraestrutura como código, começando com o provisionamento de recursos na **AWS** utilizando **Terraform**.

## 🛠️ Tecnologias

  * Terraform
  * AWS