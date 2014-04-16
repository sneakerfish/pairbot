require 'cinch'
require 'pairs'

class PairBot
  include Cinch::Plugin
  match /^pair with (.+)/, method: :join_pair, use_prefix: false
  match /^pairs/, method: :query_pairs, use_prefix: false
  match /^pair on (.+)/, method: :work_on, use_prefix: false
  match /^pair(bot)?\:? help/, method: :pair_help, use_prefix: false
  match /^pair (end|stop)/, method: :leave_pair, use_prefix: false

  def initialize(*args)
    super
    @pairs = Pairs.new
    @users = {}
  end

  def join_pair(m, nick)
    @pairs.joins(nick, m.user.nick)
    m.reply "You are now paired with #{paired_with(m.user.nick)}"
  end

  def leave_pair(m)
    @pairs.remove_from_pair(m.user.nick)
  end

  def work_on(m, task)
    @pairs.start_work_on(m.user.nick, task)
    m.reply "#{m.user.nick} and #{paired_with(m.user.nick)} now working on #{task}"
  end

  def query_pairs(m)
    message = "Pairs are:\n"
    @pairs.list_pairs.each do |pair, works_on|
                       message += pair.join(" and ") +
                                       (works_on.nil? ? "" : " on " + works_on) + "\n"
                     end
    m.reply message
  end

  def pair_help(m)
    m.reply "Commands are:"
    m.reply "pair with name       -- you pair with this name"
    m.reply "pair on task         -- your pair works on this task"
    m.reply "pairs                -- show pairs and what they work on"
    m.reply "pairbot help         -- this text"
  end

  private

  def paired_with(nick)
    @pairs.paired_with(nick).join(" and ")
  end
end
