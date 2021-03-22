abstract class SafetyJim::Command
    property name : String
    property help : String
    property group : String?
    property hidden : Bool
    property owner : Bool
    property guild : Bool
  
    def initialize(@name, @help = "No help provided.", @group = nil, @hidden = false, @owner = false, @guild = false); end
  
    # The method called when a command is executed.
    abstract def execute(ctx : SafetyJim::Context)
  end