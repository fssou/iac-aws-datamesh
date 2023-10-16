
output "bucket_raw" {
  value = module.raw.bucket
}

output "bucket_sor" {
  value = module.sor.bucket
}

output "bucket_sot" {
  value = module.sot.bucket
}

output "bucket_spec" {
  value = module.spec.bucket
}

output "athena" {
  value = module.athena
}

output "glue" {
  value = module.glue
}
