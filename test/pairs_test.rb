require 'minitest/spec'
require 'minitest/autorun'
require 'pairs'

describe Pairs do
          it "can be created with no arguments" do
            Pairs.new.must_be_instance_of Pairs
          end

          it "can assign a pair" do
            p = Pairs.new
            p.joins("a", "b")
            p.paired?("a").must_equal true
            p.paired?("b").must_equal true
          end

          it "can add to a pair" do 
            p = Pairs.new
            p.joins("a", "b")
            p.joins("b", "c")
            p.paired?("a").must_equal true
            p.paired?("b").must_equal true
          end

          it "can remove a person from a pair" do 
            p = Pairs.new
            p.joins("a", "b")
            p.remove_from_pair("a")
            p.paired?("a").must_equal false
            p.paired?("b").must_equal false
          end

          it "can assign two, have one join, have another leave" do
            p = Pairs.new
            p.joins("a", "b")  # now a,b
            p.joins("a", "c")  # now a,b,c
            p.paired_with("a").must_equal ["b", "c"]
            p.joins("d", "a")  # now a,d and b,c
            p.paired_with("a").must_equal ["d"]
            p.paired_with("b").must_equal ["c"]
          end
 
end
