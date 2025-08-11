# IAC-PROJECT

Este é um projeto de estudos sobre **Infrastructure as Code (IaC)** utilizando **Terraform** e **AWS**, com foco em boas práticas como uso de **state remoto**, **versionamento de estado**, **modularização** e **gestão centralizada de variáveis**.

---

## Status atual

- [x] Inicialização do projeto  
- [x] Configuração do provider da AWS (`providers.tf`)  
- [x] Provisionamento de bucket S3 com Terraform  
- [x] Configuração de **Remote State** no S3 com **versionamento habilitado**  
- [x] Criação de módulos internos (`s3` e `cloudfront`)  
- [x] Uso de módulo externo para SQS  
- [x] Centralização de variáveis no módulo raiz para gestão via `terraform.tfvars`  
- [x] Organização do `.gitignore` para evitar versionamento de arquivos sensíveis (`.tfstate`, `.tfvars`, `.terraform/`)  

---

## Objetivo

Explorar práticas modernas de infraestrutura como código, incluindo:

- **Provisionamento de recursos na AWS** usando Terraform  
- **Separação em módulos reutilizáveis** para facilitar manutenção e escalabilidade  
- **Armazenamento remoto do estado** com versionamento, garantindo colaboração segura  
- **Uso combinado de módulos internos e externos** para otimizar o desenvolvimento  
- **Gerenciamento centralizado de variáveis** para múltiplos ambientes (`staging`, `prod`, etc.)  

---

## Recursos provisionados até agora

- **Módulo interno S3**  
  - Criação de bucket S3 com nome dinâmico baseado no `workspace` do Terraform  
  - Configuração de *Static Website Hosting* com documentos de índice e erro  
  - Tags personalizadas via variáveis

- **Módulo interno CloudFront**  
  - Distribuição CDN integrada ao bucket S3  
  - Configuração de cache, métodos permitidos e redirecionamento HTTP → HTTPS  
  - Price Class configurável via variáveis

- **Módulo externo SQS**  
  - Utiliza o módulo oficial [`terraform-aws-modules/sqs/aws`](https://registry.terraform.io/modules/terraform-aws-modules/sqs/aws/latest)  
  - Criação de fila SQS (**sistema de mensageria**) para comunicação assíncrona entre serviços  
  - **Dead Letter Queue (DLQ)** habilitada para mensagens não processadas  
  - Tags configuráveis

- **State remoto**  
  - Armazenado em bucket S3 com versionamento ativado  
  - Facilita colaboração e histórico de alterações na infraestrutura

---

## Tecnologias

- **Terraform** `>= 1.x`  
- **AWS** (S3, CloudFront, SQS)  
- **AWS CLI** configurada com SSO ou credenciais IAM  

---

## Estrutura do projeto

```plaintext
.
├── modules/
│   ├── s3/                # Módulo interno para provisionar bucket S3
│   ├── cloudfront/        # Módulo interno para provisionar distribuição CloudFront
│   └── sqs/               # (Módulo externo chamado direto no root)
├── main.tf                # Chamada dos módulos e composição da infraestrutura
├── variables.tf           # Declaração das variáveis globais do projeto
├── outputs.tf             # Saídas globais do projeto
├── providers.tf           # Configuração do provider AWS
├── terraform.tfvars       # Valores atribuídos às variáveis globais
├── .gitignore              # Exclusão de arquivos sensíveis (state, cache, credenciais)
└── README.md
