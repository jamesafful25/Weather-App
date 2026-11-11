variable "aws_region" {
  description = "AWS region for Weather App infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the Weather App project"
  type        = string
  default     = "weather-app"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
