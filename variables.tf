variable "max_vcpus" {
  type        = number
  default     = 16
  description = <<EOF
The maximum number of vCPUs that can be used by the cluster. If all cpus are being used, no new jobs will be scheduled in this environment.
EOF
}
