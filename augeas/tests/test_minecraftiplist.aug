module Test_minecraftiplist = 

let conf = "#Minecraft ip list

127.0.0.1
192.168.0.1
"

test MinecraftIPList.lns get conf = 
  { "#comment" = "Minecraft ip list" }
  {}
  { "ip"
    { "127.0.0.1" }
    { "192.168.0.1" }
  }