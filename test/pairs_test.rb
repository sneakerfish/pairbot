require 'minitest/spec'
require 'minitest/autorun'
require 'pairs'

describe Pairs do
          let (:pair) { Pairs.new }

          it "can be created with no arguments" do
            Pairs.new.must_be_instance_of Pairs
          end

          it "can assign a pair" do
            pair.joins("a", "b")
            pair.paired?("a").must_equal true
            pair.paired?("b").must_equal true
          end

          it "can add to a pair" do 
            pair.joins("a", "b")
            pair.joins("b", "c")
            pair.paired?("a").must_equal true
            pair.paired?("b").must_equal true
          end

          it "can remove a person from a pair" do 
            pair.joins("a", "b")
            pair.remove_from_pair("a")
            pair.paired?("a").must_equal false
            pair.paired?("b").must_equal false
          end

          it "can assign two, have one join, have another leave" do
            pair.joins("a", "b")  # now a,b
            pair.joins("a", "c")  # now a,b,c
            pair.paired_with("a").must_equal ["b", "c"]
            pair.joins("d", "a")  # now a,d and b,c
            pair.paired_with("a").must_equal ["d"]
            pair.paired_with("b").must_equal ["c"]
          end
 
end
