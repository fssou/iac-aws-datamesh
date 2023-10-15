
module "data_catalog" {
  source = "./modules/data_catalog"
  bucket_name_sor = module.data_stores.bucket_sor.bucket
  bucket_name_sot = module.data_stores.bucket_sot.bucket
  bucket_name_spec = module.data_stores.bucket_spec.bucket
}

module "data_stores" {
  source = "./modules/data_stores"
}

module "data_processing" {
  source = "./modules/data_processing"
}

module "networking" {
  source = "./modules/networking"
}
