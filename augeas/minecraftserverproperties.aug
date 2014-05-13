(* Minecraft/ServerProperties module *)

module MinecraftServerProperties =

autoload xfm

let entry = [ key Rx.word . Sep.equal . store Rx.space_in . Util.eol ]

let lns = (entry | Util.comment | Util.empty)*

let filter = Util.stdexcl

let xfm = transform lns filter