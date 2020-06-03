provider "aws" {
  profile    = "default"
  region     = "eu-west-2"
}

variable "account_id" {
  description = "account id"
  type        = "string"
  default     = "708544770472"
}