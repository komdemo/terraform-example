output "myname" {
  value = var.myname
}
output "docker_id" {
  value = docker_container.nginx.id
}
output "docker_dns" {
  value = docker_container.nginx.hostname
}