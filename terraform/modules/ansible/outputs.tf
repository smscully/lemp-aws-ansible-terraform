########################################
# Ansible Module Outputs
########################################
/*
output "file_system_ids" {
  description = "IDs of the File Systems"
  value = [
    for fs in aws_efs_file_system.file_system : fs.id
  ]
}

output "mount_target_ids" {
  description = "IDs of the Mount Targets"
  value = [
    for mt in aws_efs_mount_target.mount_target: mt.id
  ]
}
*/
