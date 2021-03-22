def get_mentions(str : String)
    mentions = String.build do |string|
        index = 0
        Discord::Mention.parse(str) do |mention|
        index += 1
        string << "`[" << index << " @ " << mention.start << "]` "
        case mention
        when Discord::Mention::User
            string.puts "**User:** #{mention.id}"
        when Discord::Mention::Role
            string.puts "**Role:** #{mention.id}"
        when Discord::Mention::Channel
            string.puts "**Channel:** #{mention.id}"
        when Discord::Mention::Emoji
            string << "**Emoji:** #{mention.name} #{mention.id}"
            string << " (animated)" if mention.animated
            string.puts
        when Discord::Mention::Everyone
            string.puts "**Everyone**"
        when Discord::Mention::Here
            string.puts "**Here**"
        end
        end
    end

    mentions = "no mentions found in your message" if mentions.empty?

    return mentions
end