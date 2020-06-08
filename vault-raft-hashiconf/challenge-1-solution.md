There is more than one approach to solve the challenge, and this ***sample*** solution.


 Create the `node4` configuration file, "`config-node4.hcl`".

 ```
 storage "raft" {
   path    = "/home/scrapbook/tutorial/raft-node4/"
   node_id = "node4"

   retry_join {
     leader_api_addr = "http://127.0.0.1:8200"
   }

   retry_join {
     leader_api_addr = "http://127.0.0.1:2200"
   }
 }

 listener "tcp" {
   address = "127.0.0.1:4200"
   cluster_address = "127.0.0.1:4201"
   tls_disable = true
 }

 disable_mlock = true
 api_addr = "http://127.0.0.1:4200"
 cluster_addr = "http://127.0.0.1:4201"
 ```
