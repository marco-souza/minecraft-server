job "minecraft-server" {
  datacenters = ["dc1"]

  group "minecraft-server" {
    count = 1

    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

    volume "minecraft" {
      type      = "host"
      source    = "minecraft"
      read_only = false
    }

    network {
      mode = "bridge"

      port "http" { 
        static = 25565
        to = 25565 
      }
    }

    task "server" {
      driver = "docker"

      config {
        image = "itzg/minecraft-server"
        ports = ["http"]
      }

      volume_mount {
        volume      = "minecraft"
        destination = "/data"
        read_only   = false
      }

      env {
        EULA = "TRUE"
        VERSION = "1.16.5"
        // TYPE = "FORGE"
      }

      resources {
        cpu    = 500
        memory = 2048
      }
    }
  }
}
