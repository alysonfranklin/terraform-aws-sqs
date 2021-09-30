variable "create" {
  description = "Se deve criar fila SQS"
  type        = bool
  default     = true
}

variable "name" {
  description = "Este é o nome legível da fila. Se omitido, o Terraform atribuirá um nome aleatório."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Um nome único começando com o prefixo especificado."
  type        = string
  default     = null
}

variable "visibility_timeout_seconds" {
  description = "O tempo limite de visibilidade para a fila. Um número inteiro de 0 a 43200 (12 horas)"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "O número de segundos que o Amazon SQS retém uma mensagem. Inteiro representando segundos, de 60 (1 minuto) a 1209600 (14 dias)"
  type        = number
  default     = 345600
}

variable "max_message_size" {
  description = "O limite de quantos bytes uma mensagem pode conter antes que o Amazon SQS a rejeite. Um número inteiro de 1024 bytes (1 KiB) até 262144 bytes (256 KiB)"
  type        = number
  default     = 262144
}

variable "delay_seconds" {
  description = "O tempo em segundos que a entrega de todas as mensagens na fila será atrasada. Um número inteiro de 0 a 900 (15 minutos)"
  type        = number
  default     = 0
}

variable "receive_wait_time_seconds" {
  description = "O tempo durante o qual uma chamada ReceiveMessage aguardará a chegada de uma mensagem (pesquisa longa) antes de retornar. Um número inteiro de 0 a 20 (segundos)"
  type        = number
  default     = 0
}

variable "policy" {
  description = "A política JSON para a fila SQS"
  type        = string
  default     = ""
}

variable "redrive_policy" {
  description = "A política JSON para configurar a Dead Letter Queue, consulte os documentos da AWS. Nota: ao especificar maxReceiveCount, você deve especificá-lo como um número inteiro (5), e não como uma string (\"5\")"
  type        = string
  default     = ""
}

variable "fifo_queue" {
  description = "Booleano designando uma fila FIFO"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Ativa a desduplicação baseada em conteúdo para filas FIFO"
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "A ID de uma chave mestra de cliente gerenciada pela AWS (CMK) para Amazon SQS ou um CMK personalizado"
  type        = string
  default     = null
}

variable "kms_data_key_reuse_period_seconds" {
  description = "O período de tempo, em segundos, durante o qual o Amazon SQS pode reutilizar uma chave de dados para criptografar ou descriptografar mensagens antes de chamar o AWS KMS novamente. Um número inteiro que representa os segundos, entre 60 segundos (1 minuto) e 86.400 segundos (24 horas)"
  type        = number
  default     = 300
}

variable "tags" {
  description = "Um mapeamento de tags para atribuir a todos os recursos"
  type        = map(string)
  default     = {}
}
