require "discordcr"

require "../../handler/*"

class SafetyJim::MentionTestCmd < SafetyJim::Command
  def initialize
    super name: "mentions", guild: true, help: "argTest!"
  end

  def execute(ctx : SafetyJim::Context)
    mentions = get_mentions(ctx.args[0])
    
    ctx.send_message(mentions)
  end
end