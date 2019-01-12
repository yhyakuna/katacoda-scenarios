ui = true
disable_mlock = true

storage "file" {
  path = "/etc/vault.d/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}
