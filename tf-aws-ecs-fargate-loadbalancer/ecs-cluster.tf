resource "aws_ecs_cluster" "ECScluster" {
    name = "ecs-cluster"
    tags = {
      Name = "ecs-new-cluster"
    }
  
}