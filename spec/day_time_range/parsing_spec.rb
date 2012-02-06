require 'spec_helper'

describe DayTimeRange do

  it "default separator is ' until '" do
    DayTimeRange.separator.should == ' until '
  end

  it "start time is correct" do
    dtr = DayTimeRange.new("8 until 11", :separator => " until ")
    dtr.start.should == DayTime.new(8)
  end

  it "start time is correct" do
    dtr = DayTimeRange.new("8 - 11", :separator => " - ")
    dtr.start.should == DayTime.new(8)
  end

  it "start time is correct" do
    dtr = DayTimeRange.new("8..11", :separator => "..")
    dtr.start.should == DayTime.new(8)
  end

end
