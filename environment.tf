resource "aws_batch_compute_environment" "this" {
  compute_environment_name = local.resource_name

  compute_resources {
    max_vcpus = var.max_vcpus
    min_vcpus = 0

    security_group_ids = [aws_security_group.this.id]

    subnets = local.private_subnet_ids

    type = "FARGATE"
  }

  service_role = aws_iam_role.aws_batch_service_role.arn
  type         = "MANAGED"
  depends_on   = [aws_iam_role_policy_attachment.aws_batch_service_role]
}

resource "aws_iam_role" "aws_batch_service_role" {
  name               = local.resource_name
  assume_role_policy = data.aws_iam_policy_document.batch_assume_role.json
}

resource "aws_iam_role_policy_attachment" "aws_batch_service_role" {
  role       = aws_iam_role.aws_batch_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

data "aws_iam_policy_document" "batch_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["batch.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_security_group" "this" {
  name        = local.resource_name
  vpc_id      = local.vpc_id
  tags        = merge(local.tags, { Name = local.resource_name })
  description = "Managed by Terraform"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
