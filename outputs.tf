output "compute_environment_arn" {
  value       = aws_batch_compute_environment.this.arn
  description = "string ||| AWS Arn for the compute environment."
}

output "compute_environment_name" {
  value       = aws_batch_compute_environment.this.compute_environment_name
  description = "string ||| Name of the compute environment."
}
