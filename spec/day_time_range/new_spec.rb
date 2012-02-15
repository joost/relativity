require 'spec_helper'

describe DayTimeRange do

  it "builds new with 1 argument" do
    DayTimeRange.new("8 until 11").should_not be_nil
  end

  it "new(nil) raises error" do
    lambda {DayTimeRange.new(nil)}.should raise_error Relativity::InvalidRangeFormatError
  end

  it "start day_time is correct" do
    dtr = DayTimeRange.new("8 until 11")
    dtr.start.should == DayTime.new(8)
  end

  it "end day_time is correct" do
    dtr = DayTimeRange.new("8 until 11")
    dtr.end.should == DayTime.new(11)
  end

  it "day_times are correct with complex time" do
    dtr = DayTimeRange.new("8:35 until 17:59:30")
    dtr.start.should == DayTime.new(8,35)
    dtr.end.should == DayTime.new(17,59,30)
  end

end
