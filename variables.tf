variable "max_vcpus" {
  type        = number
  default     = 16
  description = <<EOF
EOF
}

variable "allocation_strategy" {
  type        = string
  default     = "BEST_FIT"
  description = <<EOF
Valid values are BEST_FIT | BEST_FIT_PROGRESSIVE | SPOT_CAPACITY_OPTIMIZED | SPOT_PRICE_CAPACITY_OPTIMIZED.
EOF
}
