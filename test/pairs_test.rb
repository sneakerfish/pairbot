require 'minitest/spec'
require 'minitest/autorun'
require 'pairs'

describe Pairs do
          it "can be created with no arguments" do
            Pairs.new.must_be_instance_of Pairs
          end

          it "can assign a pair" do
            p = Pairs.new
            p.make_pair("a", "b")
            p.paired?("a").must_equal true
            p.paired?("b").must_equal true
          end

          it "can reassign a pair" do 
            p = Pairs.new
            p.make_pair("a", "b")
            p.make_pair("b", "c")
            p.paired?("a").must_equal false
            p.paired?("b").must_equal true
          end

          it "can remove a person from a pair" do 
            p = Pairs.new
            p.make_pair("a", "b")
            p.remove_from_pair("a")
            p.paired?("a").must_equal false
            p.paired?("b").must_equal false
          end
end
