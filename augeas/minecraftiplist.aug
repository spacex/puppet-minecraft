(* Minecraft/IPList module *)

module MinecraftIPList = 

autoload xfm

let entry = [ seq "ip" . store Rx.ip . Util.eol ]

let lns = ( entry | Util.empty | Util.comment )*

let filter = Util.stdexcl

let xfm = transform lns filter