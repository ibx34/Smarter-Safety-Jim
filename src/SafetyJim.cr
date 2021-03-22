require "discordcr"
require "./config"
require "./SafetyJim/handler/*"

require "./SafetyJim/commands/*"
require "./SafetyJim/commands/utility/*"

module SafetyJim
  VERSION = "0.1.0"

  client = Discord::Client.new(token: "Bot #{TOKEN}", client_id: CLIENT_ID)
  cache = Discord::Cache.new(client)
  client.cache = cache

  commands = Array(SafetyJim::Command){SafetyJim::PingCmd.new}

  handler = SafetyJim::Handler.new client, PREFIX, OWNER_IDS, commands

  client.run
end
