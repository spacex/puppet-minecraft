module Puppet::Parser::Functions
  newfunction(:get_vanilla_latest_version, :type => :rvalue, :arity => 1) do |args|
    require 'open-uri'
    require 'json'
    
    #url = 'http://s3.amazonaws.com/Minecraft.Download/versions/versions.json'
    url = 'https://s3.amazonaws.com/Minecraft.Download/versions/versions.json'
    
    JSON.parse(open(url).read)['latest'][args[0]]
  end
end