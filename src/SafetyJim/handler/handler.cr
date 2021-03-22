require "discordcr"

require "./command"

class SafetyJim::Handler
  getter client : Discord::Client
  getter prefix : String

  getter owner_ids : Array(UInt64)

  getter commands : Array(SafetyJim::Command)?

  def initialize(@client, @prefix, @owner_ids, @commands = nil)
    @client.on_message_create { |payload| handle payload }
  end

  def add_commands(*commands : SafetyJim::Command)
    commands.each do |command|
      @commands << command
    end
  end

  def handle(payload : Discord::Message)
    return if @commands.nil?

    if payload.content.starts_with? @prefix
      cmd = match(payload).nil? ? return : match(payload).as(SafetyJim::Command)

      return if payload.guild_id.nil? && cmd.guild
      return if !@owner_ids.any? payload.author.id

      ctx = SafetyJim::Context.new @client, payload, cmd, self

      cmd.execute ctx
    end
  end

  def match(payload : Discord::Message)
    message = payload.content.downcase

    @commands.as(Array(SafetyJim::Command)).each do |command|
      if message.starts_with?("#{@prefix}#{command.name} ") || message == "#{@prefix}#{command.name}"
        return command
      end
    end
  end

  def match_command(name : String)
    @commands.as(Array(SafetyJim::Command)).each do |command|
      split = name.split(" ")

      if split[0] == command.name
        return command
      end
    end
  end

  def match_group(name : String)
    @commands.as(Array(SafetyJim::Command)).each do |command|
      if command.group == name
        yield command
      end
    end
  end
end