
resource "aws_ecs_service" "ECSservice" {
  name            = "ecs-service"
  launch_type = "FARGATE"
  platform_version = "LATEST"
  cluster         = aws_ecs_cluster.ECScluster.id
  task_definition = aws_ecs_task_definition.TD.arn
  desired_count   = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent = 200
  //iam_role        = aws_iam_role.iam-role.arn
  depends_on      = [aws_alb_listener.Listener, aws_iam_role.iam-role]


  load_balancer {
    target_group_arn = aws_lb_target_group.TG.arn
    container_name   = "ecs-container"
    container_port   = 80
  }
 network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.SG.id]
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  }
}