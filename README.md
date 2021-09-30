# Módulo Terraform AWS SQS

Módulo Terraform que cria recursos SQS na AWS.

## Uso

```hcl
module "sqs_queue" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 2.0"

  name = "user"

  tags = {
    resource     = "sqs"
    environment = "prod"
  }
}
```

## Exemplos

- [Filas SQS com criptografia do lado do servidor (SSE) usando KMS e sem SSE](https://github.com/terraform-aws-modules/terraform-aws-sqs/tree/master/examples/complete)

## Criação condicional

Às vezes você precisa ter uma maneira de criar a fila SQS condicionalmente, mas o Terraform não permite o uso de `count` dentro do bloco` module`, então a solução é especificar o argumento `create`.

```hcl
# Esta fila SQS não será criada
module "sqs_queue" {
  source  = "git::https://github.com/alysonfranklin/terraform-aws-sqs.git?ref=tags/3.1.0"
  version = "~> 2.0"

  create = false
  #omitido
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Nome | Versão |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.30 |

## Providers

| Nome | Versão |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.30 |

## Modules

Sem módulos.

## Resources

| Nome | Tipo |
|------|------|
| [aws_sqs_queue.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_arn.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |

## Inputs

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Ativa a desduplicação baseada em conteúdo para filas FIFO | `bool` | `false` | no |
| <a name="input_create"></a> [create](#input\_create) | Se deve criar fila SQS | `bool` | `true` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | O tempo em segundos que a entrega de todas as mensagens na fila será atrasada. Um número inteiro de 0 a 900 (15 minutos) | `number` | `0` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Booleano designando uma fila FIFO | `bool` | `false` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | O período de tempo, em segundos, durante o qual o Amazon SQS pode reutilizar uma chave de dados para criptografar ou descriptografar mensagens antes de chamar o AWS KMS novamente. Um número inteiro que representa os segundos, entre 60 segundos (1 minuto) e 86.400 segundos (24 horas) | `number` | `300` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | A ID de uma chave mestra de cliente gerenciada pela AWS (CMK) para Amazon SQS ou um CMK personalizado | `string` | `null` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | O limite de quantos bytes uma mensagem pode conter antes que o Amazon SQS a rejeite. Um número inteiro de 1024 bytes (1 KiB) até 262144 bytes (256 KiB) | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | O número de segundos que o Amazon SQS retém uma mensagem. Inteiro representando segundos, de 60 (1 minuto) a 1209600 (14 dias) | `number` | `345600` | no |
| <a name="input_name"></a> [name](#input\_name) | Este é o nome legível da fila. Se omitido, o Terraform atribuirá um nome aleatório. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Um nome único começando com o prefixo especificado. | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A política JSON para a fila SQS | `string` | `""` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | O tempo durante o qual uma chamada ReceiveMessage aguardará a chegada de uma mensagem (pesquisa longa) antes de retornar. Um número inteiro de 0 a 20 (segundos) | `number` | `0` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | A política JSON para configurar a Dead Letter Queue, consulte os documentos da AWS. Observação: ao especificar maxReceiveCount, você deve especificá-lo como um número inteiro (5), e não como uma string ("5") | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Um mapeamento de tags para atribuir a todos os recursos | `map(string)` | `{}` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | O tempo limite de visibilidade para a fila. Um número inteiro de 0 a 43200 (12 horas) | `number` | `30` | no |

## Outputs

| Nome | Descrição |
|------|-------------|
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | O ARN da fila SQS |
| <a name="output_sqs_queue_id"></a> [sqs\_queue\_id](#output\_sqs\_queue\_id) | O URL para a fila Amazon SQS criada |
| <a name="output_sqs_queue_name"></a> [sqs\_queue\_name](#output\_sqs\_queue\_name) | O nome da fila SQS |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->