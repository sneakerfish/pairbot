require 'cinch'
require 'pairs'

class PairBot
  include Cinch::Plugin
  listen_to :channel
  match /pair with (.+)/

  def initialize(bot)
    @pairs = Pairs.new
    @users = {}
  end

  def execute(m, nick)
    @pairs.join(m.user.nick, nick)
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.freenode.org'
    c.channels = ['#cinch-bots']
    c.verbose = true
    c.plugins.plugins = [PairBot]
  end
end

bot.start
