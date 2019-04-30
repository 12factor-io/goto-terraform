resource "openfaas_function" "function_sha512" {
  name            = "sha512"
  image           = "functions/alpine:latest"
  f_process       = "sha512sum"
  labels {
    Group       = "London"
    Environment = "Staging"
  }
}
