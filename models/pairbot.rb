require 'cinch'
require 'pairs'

class PairBot
  include Cinch::Plugin
  match /pair with (.+)/, method: :join_pair
  match /pairs/, method: :query_pairs
  match /pair on (.+)/, method: :work_on
  match /^command3 (.+)/, use_prefix: false

  def initialize(*args)
    super
    @pairs = Pairs.new
    @users = {}
  end

  def join_pair(m, nick)
    @pairs.joins(nick, m.user.nick)
    m.reply "You are now paired with #{paired_with(m.user.nick)}"
  end

  def work_on(m, task)
    @pairs.start_work_on(m.user.nick, task)
    m.reply "#{paired_with(m.user.nick)} now working on #{task}"
  end

  def query_pairs(m)
    message = "Pairs are:\n" 
    @pairs.list_pairs.each do |pair, works_on|
                       message += pair.join("and ") + 
                                       (works_on.nil? ? "" : " on " + works_on) + "\n"
                     end
    m.reply message
  end

  def execute(m, arg)
    m.reply "command3: arg: #{arg}"
  end

  private
  
  def paired_with(nick)
    @pairs.paired_with(nick).join(" and ")
  end
end

