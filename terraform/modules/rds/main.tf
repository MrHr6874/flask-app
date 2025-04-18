# terraform/modules/rds/main.tf
resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = var.db_identifier
  engine                  = "postgres"
  engine_version          = "17.2"       # Changed this to a valid version, prior 15.3, 15.5
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  port                    = 5432
  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = false
  db_subnet_group_name    = aws_db_subnet_group.rds.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  tags = {
    Name = "flask-postgres-db"
  }
}


resource "aws_security_group" "rds_sg" {
  name_prefix = "rds_sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.security_group_id]   #Fixd this line as of now
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}
