module Test_minecraftuserlist = 

let conf = "#Minecraft user list

abcd
abcd1234
"

test MinecraftUserList.lns get conf = 
  { "#comment" = "Minecraft user list" }
  {}
  { "user"
    { "abcd" }
    { "abcd1234" }
  }