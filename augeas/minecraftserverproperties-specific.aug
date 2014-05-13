(* Minecraft/ServerProperties module *)

module MinecraftServerProperties =

autoload xfm

let key_value_string (kw:string) = key_value Rx.space_in
let key_value_integer (kw:string) = key_value Rx.integer
let key_value_bool (kw:string) = key_value kw /false|true/i
let key_value (kw:string) (val:lens) = [ key kw . Sep.equal . store val . Util.eol ]

let entry = key_value_string  "generator-settings" |
            key_value         "op-permission-level" /[0-4]/ |
            key_value_string  "level-name" |
            key_value_bool    "enable-query" |
            key_value_bool    "allow-flight" |
            key_value_bool    "announce-player-achievements" |
            key_value_integer "server-port" |
            key_value_string  "level-type" |
            key_value_bool    "enable-rcon" |
            key_value_string  "level-seed" |
            key_value_bool    "force-gamemode" |
            key_value         "server-ip" Rx.ip |
            key_value_integer "max-build-height" |
            key_value_bool    "spawn-npcs" |
            key_value_bool    "white-list" |
            key_value_bool    "spawn-animals" |
            key_value_bool    "hardcore" |
            key_value_bool    "snooper-enabled" |
            key_value_bool    "online-mode" |
            key_value_string  "resource-pack" |
            key_value_bool    "pvp" |
            key_value         "difficulty" /[0-3]/ |
            key_value_bool    "enable-command-block" |
            key_value         "gamemode"  /[0-3]/ |
            key_value_integer "player-idle-timeout" |
            key_value_integer "max-players" |
            key_value_bool    "spawn-monsters" |
            key_value_bool    "generate-structures"
            key_value_integer "view-distance" |
            key_value_string  "motd"

let lns = (entry | Util.comment | Util.empty)*

let filter = Util.stdexcl

let xfm = transform lns filter