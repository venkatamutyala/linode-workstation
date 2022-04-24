resource "linode_lke_cluster" "venkata-test-1" {
  label       = "venkata-test-1"
  k8s_version = "1.23"
  region      = "us-southeast"

  pool {
    type  = "g7-highmem-1"
    count = 3

    autoscaler {
      min = 1
      max = 1
    }
  }
}