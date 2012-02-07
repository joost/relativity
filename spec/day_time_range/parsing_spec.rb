require 'spec_helper'

describe DayTimeRange do

  it "default separator is ' until '" do
    DayTimeRange.separator.should == ' until '
  end

  it "start time is correct" do
    dtr = DayTimeRange.new("8 until 11", :separator => " until ")
    dtr.start.should == DayTime.new(8)
  end

  it "start time is correct with other separator" do
    dtr = DayTimeRange.new("8 - 11", :separator => " - ")
    dtr.start.should == DayTime.new(8)
  end

  it "start time is correct with separator without spaces" do
    dtr = DayTimeRange.new("8..11", :separator => "..")
    dtr.start.should == DayTime.new(8)
  end

  it "InvalidRangeFormatError is raised with incorrect separator format" do
    lambda {DayTimeRange.new("8..11")}.should raise_error Relativity::InvalidRangeFormatError
  end

  it "Exception with separator message is raised with incorrect separator format" do
    lambda {DayTimeRange.new("8..11")}.should raise_error 'Maybe the range separator was not set correctly? Separator used was " until "'
  end

end
