require 'spec_helper'

describe DayTimeRange do

  it "builds new with 1 argument" do
    lambda { DayTimeRange.new("8 until 11") }.should_not raise_error
  end

  it "start time is correct" do
    dtr = DayTimeRange.new("8 until 11")
    dtr.start.should == DayTime.new(8)
  end

  it "end time is correct" do
    dtr = DayTimeRange.new("8 until 11")
    dtr.end.should == DayTime.new(11)
  end

end
