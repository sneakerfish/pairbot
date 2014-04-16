require 'minitest/spec'
require 'minitest/autorun'
require 'cinch/test'
require 'pairs'
require 'pairbot'

include Cinch::Test

describe PairBot do
          let (:bot) { make_bot(PairBot, {}) }

          it "can create a pair" do
            msg = make_message(bot, "pair with abe")
            replies = get_replies(msg)
            replies[0].text.must_equal "You are now paired with abe"
          end

          it "can create a pair and assign work." do
            msg = make_message(bot, "pair with ben")
            replies = get_replies(msg)
            replies[0].text.must_equal "You are now paired with ben"
            msg = make_message(bot, "pair on testing")
            replies = get_replies(msg)
            replies[0].text.must_include "now working on testing"
          end

          it "can list pairs" do
            msg = make_message(bot, "pair with charles")
            replies = get_replies(msg)
            msg = make_message(bot, "pairs")
            replies = get_replies(msg)
            replies.each { |t| puts t.text }
            replies[0].text.must_include "Pairs are"
            replies[0].text.must_include "charles"
          end

          it "can provide help" do
            msg = make_message(bot, "pair help")
            replies = get_replies(msg)
            replies[0].text.must_include "Commands are"
            msg = make_message(bot, "pairbot help")
            replies = get_replies(msg)
            replies[0].text.must_include "Commands are"
          end

          it "can allow a pair to leave" do
            msg = make_message(bot, "pair with abe")
            replies = get_replies(msg)
            replies[0].text.must_equal "You are now paired with abe"
            msg = make_message(bot, "pair leave")
            msg = make_message(bot, "pairs")
            replies = get_replies(msg)
            replies[0].text.wont_include "paired with abe"
          end

end
