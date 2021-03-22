require "discordcr"

require "./command"
require "./handler"

class SafetyJim::Context
  getter client : Discord::Client
  getter payload : Discord::Message
  getter command : SafetyJim::Command
  getter handler : SafetyJim::Handler

  getter author : Discord::User

  getter guild_id : Discord::Snowflake?
  getter channel_id : Discord::Snowflake
  getter id : Discord::Snowflake

  getter args : Array(String)

  def initialize(@client, @payload, @command, @handler)
    @author = @payload.author

    @guild_id = @payload.guild_id
    @channel_id = @payload.channel_id
    @id = @payload.id

    call_string = "#{@handler.prefix}#{command.name}"

    @args = @payload.content.lchop(call_string).split(" ", remove_empty: true)
  end

  def send_message(message : String)
    @client.create_message(@channel_id, message)
  end
end