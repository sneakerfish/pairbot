require 'minitest/spec'
require 'minitest/autorun'
require 'cinch/test'
require 'pairs'
require 'pairbot'

include Cinch::Test

describe PairBot do
          let (:bot) { make_bot(PairBot, {}) }

          it "can create a pair" do
            msg = make_message(bot, "!pair with abe")
            replies = get_replies(msg)
            replies[0].text.must_equal "You are now paired with abe"
          end

end
