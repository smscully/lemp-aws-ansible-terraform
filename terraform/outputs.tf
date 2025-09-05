########################################
# Root Module Outputs
########################################
output "networking_module" {
  value = module.networking
}

output "ec2_module" {
  value = module.ec2
}

/*
output "apache_module" {
  value = module.apache
}
*/

/*
output "nginx_module" {
  value = module.nginx
}
*/

output "route53_module" {
  value = module.route53
}

/*
output "efs_module" {
  value = module.efs
}
*/
