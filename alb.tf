resource "aws_lb" "sample_lb" {
    for_each           = var.alb_names
    name               = each.value
    internal           = false
    load_balancer_type = "application" 
    # security_groups    = var.security_grp
    subnets            = [aws_subnet.public.id, aws_subnet.private.id]
    enable_cross_zone_load_balancing = "true"
    tags = {
         Environment = "Production"
         Role        = "Sample-Application"
    }
}

# It will create the target group for each mentioned ALB
resource "aws_lb_target_group" "sample_tg" {
   for_each           = var.alb_names
   name               = each.value
   target_type        = "instance"
   port               = 80
   protocol           = "HTTP"
   vpc_id             = aws_vpc.main.id
  
}