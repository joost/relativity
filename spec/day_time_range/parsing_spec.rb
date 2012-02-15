require 'spec_helper'

describe DayTimeRange do


  it "start time is correct" do
    dtr = DayTimeRange.new("8 until 11", :separator => " until ")
    dtr.start.should == DayTime.new(8)
  end

  it "parsing is correct with other separator" do
    dtr = DayTimeRange.new("8 - 11", :separator => " - ")
    dtr.start.should == DayTime.new(8)
  end

  it "parsing is correct with separator without spaces" do
    dtr = DayTimeRange.new("8..11", :separator => "..")
    dtr.start.should == DayTime.new(8)
  end

  it "parsing with other separator remembers the separator" do
    dtr = DayTimeRange.new("8 - 11", :separator => " - ")
    dtr.separator.should == " - "
  end

  it "sets the separator" do
    dtr = DayTimeRange.new("8 - 11", :separator => " - ")
    dtr.separator = ".."
    dtr.separator.should == ".."
  end

  it "not setting separator returns default_separator" do
    dtr = DayTimeRange.new("8 until 11")
    dtr.separator.should == " until "
  end

  it "not setting separator with different separator does not reais exception" do
    dtr = DayTimeRange.new("8..11")
  end

  it "not setting separator returns correct separator" do
    dtr = DayTimeRange.new("8..11")
    dtr.separator.should == '..'
  end

  it "not setting separator returns correct full result" do
    dtr = DayTimeRange.new("8..11")
    dtr.to_s.should == "08:00:00..11:00:00"
  end

end
