terraform {
  backend "gcs" {
    #project_id="automate-357907"
    bucket = "mytf-states-terraform-2"
    prefix = "cloud_build_samp"
    #impersonate_service_account = "196069267713@cloudbuild.gserviceaccount.com"
  }
}
module "vpc" {
  source     = "../../modules/net-vpc"
  project_id = "empyrean-flight-357906"
  name       = "my-network-cicd-2"
#   psa_config = {
#     ranges = { vpc-private-connect-2 = "/20"
#      }
#     routes = null
#   }
  

  subnets = [
    {
      ip_cidr_range = "10.0.0.0/26"
      name          = "subnet-1"
      private_ip_google_access=true
      region        = "europe-west1"
      secondary_ip_range = {
        pods     = "192.16.0.0/20"
        services = "192.168.0.0/24"
      }
    }
  ]
 
}
module "container_registry" {
  source     = "../../modules/container-registry"
  project_id = var.project_id
  location   = "EU"
  iam = {
    "roles/storage.admin" = ["serviceAccount:858144231994@cloudbuild.gserviceaccount.com"]
  }
}
module "climate_app_storage_1" {
  source     = "../../modules/gcs"
  project_id = var.project_id

  name = "app-${var.project_id}"
  
  location = "US"
  iam = {
    "roles/storage.objectViewer"       = ["user:allUsers"]
    
  }


}