require 'cinch'
require 'pairs'

class PairBot
  include Cinch::Plugin
  match /pair with (.+)/, method: :join_pair
  match /pairs/, method: :query_pairs
  match /^command3 (.+)/, use_prefix: false

  def initialize(*args)
    super
    @pairs = Pairs.new
    @users = {}
  end

  def join_pair(m, nick)
    @pairs.joins(nick, m.user.nick)
    m.reply "You are now paired with #{@pairs.paired_with(m.user.nick).join(', ')}"
  end

  def query_pairs(m)
    m.reply "Pairs are: xxx"
  end

  def execute(m, arg)
    m.reply "command3: arg: #{arg}"
  end
end

