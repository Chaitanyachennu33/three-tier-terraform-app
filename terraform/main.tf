resource "aws_db_instance" "db" {
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"

  identifier          = "three-tier-db"
  db_name             = "appdb"

  username            = var.db_username
  password            = var.db_password

  skip_final_snapshot = true
  publicly_accessible = false
}


resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecr_repository" "repo" {
  name = "three-tier-app"
}

resource "aws_ecs_cluster" "cluster" {
  name = "three-tier-cluster"
}
