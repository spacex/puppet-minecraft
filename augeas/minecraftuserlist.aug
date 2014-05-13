(* Minecraft/UserList module *)

module MinecraftUserList = 

autoload xfm

let entry = [ seq "user" . store Rx.word . Util.eol ]

let lns = ( entry | Util.empty | Util.comment )*

let filter = Util.stdexcl

let xfm = transform lns filter