resource "aws_ecs_task_definition" "TD" {
    family = "nginx"
    requires_compatibilities = ["FARGATE"]
    execution_role_arn = aws_iam_role.iam-role.arn
    network_mode = "awsvpc"
    memory = 2048
    cpu = 1024
    container_definitions = jsonencode([
        {
            name ="main_coniner"
            image = "vigneswarirajagopal/sample-python:v1"
            cpu = 1024
            memory = 2048
            essential = true
            portMappings =[
                {
                    containerPort = 80
                    hostPort = 80
                }
            ]

        }
    ])
  
}

data "aws_ecs_task_definition" "TD" {
    task_definition = aws_ecs_task_definition.TD.family

}

