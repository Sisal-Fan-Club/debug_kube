provider "kubernetes" {
  insecure = true
  
  #host = local.oke.endpoints.public_endpoint
  host = "https://129.152.15.28:6443"
  token = base64decode(local.sa.data.token)
}

locals {
  oke = local.tfe_workspace_outputs.test_oke.test_oke
  sa = local.tfe_workspace_outputs.test_oke.terraform_sa
}


resource "kubernetes_namespace" "example-1" {
  metadata {
    name = "my-first-namespace-1"
  }
}
