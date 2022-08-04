

variable "iam" {
  description = "IAM bindings for topic in {ROLE => [MEMBERS]} format."
  type        = map(list(string))
  default     = {}
}

variable "location" {
  description = "Registry location. Can be US, EU, ASIA or empty."
  type        = string
  default     = ""
}

variable "project_id" {
  description = "Registry project id."
  type        = string
}
