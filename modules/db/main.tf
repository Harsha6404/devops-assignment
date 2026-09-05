resource "aws_db_subnet_group" "default" {
  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "this" {
  allocated_storage    = 20
  storage_type         = "gp3"
  engine               = "postgres"
  engine_version       = "16.15-R1"
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = var.sg_ids
  multi_az             = var.multi_az
  skip_final_snapshot  = true
  publicly_accessible  = false
  backup_retention_period = 7
  deletion_protection  = false
}

output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}
