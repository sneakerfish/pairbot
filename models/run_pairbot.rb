require 'cinch'
require 'pairs'
require 'pairbot'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.freenode.org'
    c.channels = ['#cinch-bots']
    c.nick = "pairbot"
    c.verbose = true
    c.plugins.plugins = [PairBot]
  end
end

bot.start
