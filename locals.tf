locals {
  authorized_keys = compact(split("\n", data.http.example.body))
  ttl             = 30
}