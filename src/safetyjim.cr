require "discordcr"
require "./config"

module Safetyjim
  VERSION = "0.1.0"

  client = Discord::Client.new(token: "Bot #{TOKEN}", client_id: CLIENT_ID)
  cache = Discord::Cache.new(client)
  client.cache = cache

  client.run
end
