storage "raft" {
  path    = "/home/scrapbook/tutorial/raft-node3/"
  node_id = "node3"

  retry_join {
    leader_api_addr = "http://127.0.0.1:8200"
  }
  
  retry_join {
    leader_api_addr = "http://127.0.0.1:2200"
  }
}

listener "tcp" {
  address = "127.0.0.1:3200"
  cluster_address = "127.0.0.1:3201"
  tls_disable = true
}

ui = true
disable_mlock = true
api_addr = "http://127.0.0.1:3200"
cluster_addr = "http://127.0.0.1:3201"
