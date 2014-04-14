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
            pair.joins("abe", "ben")  # now a,b
            pair.joins("abe", "chuck")  # now a,b,c
            pair.paired_with("abe").must_equal ["ben", "chuck"]
            pair.joins("doris", "abe")  # now a,d and b,c
            pair.paired_with("abe").must_equal ["doris"]
            pair.paired_with("ben").must_equal ["chuck"]
          end

          it "can work on something" do
            pair.joins("a", "b")
            pair.start_work_on("a", "something")
            pair.working_on("a").must_equal "something"
            pair.working_on("b").must_equal "something"
          end

          it "can work on something else" do
            pair.joins("a", "b")
            pair.start_work_on("a", "something")
            pair.start_work_on("a", "something else")
            pair.working_on("a").must_equal "something else"
            pair.working_on("b").must_equal "something else"
          end
end
