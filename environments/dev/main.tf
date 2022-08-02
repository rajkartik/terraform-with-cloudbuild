terraform {
  backend "gcs" {
    bucket = "mytf-states-terraform"
    prefix = "cloud_build_samp"
  }
}
module "vpc" {
  source     = "../../modules/net-vpc"
  project_id = "automate-357907"
  name       = "my-network-cicd-2"
#   psa_config = {
#     ranges = { vpc-private-connect-2 = "/20"
#      }
#     routes = null
#   }
  

  subnets = [
    {
      ip_cidr_range = "10.0.0.0/25"
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