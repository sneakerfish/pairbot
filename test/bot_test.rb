require 'minitest/spec'
require 'minitest/autorun'
require 'cinch/test'
require 'pairs'
require 'pairbot'

describe PairBot do
          include Cinch::Test
          let (:bot) { make_bot(PairBot, {}) }

          it "can create a pair" do
            msg = make_message(bot, "!pair with abe")
            get_replies(msg)
          end

end
