require "discordcr"

require "../../handler/*"

class SafetyJim::ArgTestCmd < SafetyJim::Command
  def initialize
    super name: "argtest", guild: true, help: "argTest!"
  end

  def execute(ctx : SafetyJim::Context)

    ctx.send_message("Here you're!```#{ctx.args}```")
  end
end