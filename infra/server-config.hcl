data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled = true
  bootstrap_expect = 1
}

client {
  enabled = true
  servers = ["127.0.0.1:4646"]

  options = {
    "user.checked_drivers" = "docker,exec,raw_exec"
  }
  
  # volumes
  host_volume "minecraft" {
    path      = "/home/marco/dev/github.com/marco-souza/minecraft-server/infra/data"
    read_only = false
  }
}
