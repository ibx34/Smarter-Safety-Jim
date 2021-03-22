require "discordcr"

require "../../handler/*"

class SafetyJim::PingCmd < SafetyJim::Command
  def initialize
    super name: "ping", guild: true, help: "Pong!"
  end

  def execute(ctx : SafetyJim::Context)
    ctx.send_message("Pong")
  end
end