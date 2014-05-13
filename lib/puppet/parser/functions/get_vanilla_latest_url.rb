module Puppet::Parser::Functions
  newfunction(:get_vanilla_latest_url, :type => :rvalue, :arity => 1) do |args|
    Puppet::Parser::Functions.function('get_vanilla_latest_version')
    Puppet::Parser::Functions.function('get_vanilla_url')
    get_vanilla_url(function_get_vanilla_latest_version([ args[0] ]))
  end
end