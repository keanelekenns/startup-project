terraform {
  required_providers {
    google =  {
    source = "hashicorp/google"
    version = ">= 4.10.0"
    }
  }
}

provider "google" {
    project = "dj-339721"
    region = "us-west1"
}

resource "google_storage_bucket" "terraform_backend_bucket" {
      location = "us-west1"
      name = "terraform-state-10jx3jbbfj7iwm5v0hf3crppcb2dji9uzabjp3a481flr"
      project = "dj-339721"
}

resource "google_storage_bucket" "storage-bucket-qitn-qrkv-mhhg-bbjf-ilks" {
      name = "storage-bucket-qitn-qrkv-mhhg-bbjf-ilks"
      location = "us-west1"
      project = "dj-339721"
}

resource "google_storage_bucket" "storage-bucket-gplk-tzyk-hkqn-ttxs-nqlp" {
      name = "storage-bucket-gplk-tzyk-hkqn-ttxs-nqlp"
      location = "us-west1"
      project = "dj-339721"
}

resource "google_storage_bucket" "storage-bucket-entd-eudk-ojpl-itsp-hfha" {
      name = "storage-bucket-entd-eudk-ojpl-itsp-hfha"
      location = "us-west1"
      project = "dj-339721"
}

resource "google_storage_bucket" "storage-bucket-ydzy-lssl-iody-ngoj-noor" {
      name = "storage-bucket-ydzy-lssl-iody-ngoj-noor"
      location = "us-west1"
      project = "dj-339721"
}

resource "google_compute_instance" "gce-pspr" {
      name = "gce-pspr"
      machine_type = "f1-micro"
      zone = "us-west1-a"
      network_interface {
        network = "default"
      }
      boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20220204"
        }
      }
      project = "dj-339721"
}

resource "google_project_service" "gce-pspr-service" {
      disable_on_destroy = false
      service = "compute.googleapis.com"
}

resource "google_cloud_run_service" "test-run-devxp" {
      name = "test-run-devxp"
      location = "us-west1"
      autogenerate_revision_name = true
      template {
        spec {
          containers {
            image = "gcr.io/devxp-339721/devxp:2faa0b7"
            env {
              name = "CONNECTION_STRING"
              value = var.CLOUD_RUN_CONNECTION_STRING
            }
            env {
              name = "GITHUB_CLIENT_ID"
              value = var.CLOUD_RUN_GITHUB_CLIENT_ID
            }
            env {
              name = "GITHUB_CLIENT_SECRET"
              value = var.CLOUD_RUN_GITHUB_CLIENT_SECRET
            }
          }
        }
      }
      traffic {
        percent = 100
        latest_revision = true
      }
      depends_on = [google_project_service.test-run-devxp-service]
}

resource "google_cloud_run_service_iam_member" "test-run-devxp-iam" {
      service = google_cloud_run_service.test-run-devxp.name
      location = google_cloud_run_service.test-run-devxp.location
      project = google_cloud_run_service.test-run-devxp.project
      role = "roles/run.invoker"
      member = "allUsers"
}

resource "google_project_service" "test-run-devxp-service" {
      disable_on_destroy = false
      service = "run.googleapis.com"
}


variable "CLOUD_RUN_CONNECTION_STRING" {
    type = string
    sensitive = true
}

variable "CLOUD_RUN_GITHUB_CLIENT_ID" {
    type = string
    sensitive = true
}

variable "CLOUD_RUN_GITHUB_CLIENT_SECRET" {
    type = string
    sensitive = true
}

output "test-run-devxp-service-url" {
    value = google_cloud_run_service.test-run-devxp.status[0].url
}

