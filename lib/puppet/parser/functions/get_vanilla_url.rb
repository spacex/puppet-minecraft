module Puppet::Parser::Functions
  newfunction(:get_vanilla_url, :type => :rvalue, :arity => 1) do |args|
    "https://s3.amazonaws.com/Minecraft.Download/versions/" + args[0] + "/minecraft_server." + args[0] + ".jar"
  end
end