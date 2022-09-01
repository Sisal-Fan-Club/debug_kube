provider "kubernetes" {
  insecure = true
  
  host = local.oke.endpoints.public_endpoint
  token = local.sa.data.token
}

locals {
  oke = test_compartment = local.tfe_workspace_outputs.test_oke.test_oke
  sa = test_compartment = local.tfe_workspace_outputs.test_oke.terraform_sa
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}
