output "instances" {
  value = aws_instance.WEB.*.id
  
}