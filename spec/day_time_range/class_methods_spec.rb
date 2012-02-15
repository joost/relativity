require 'spec_helper'

describe DayTimeRange, "normalize" do

  it "normalizes with 1 argument" do
    DayTimeRange.normalize("8 until 11").should == "08:00:00 until 11:00:00"
  end

  it "incorrect entry raises error" do
    lambda {DayTimeRange.normalize("8")}.should raise_error Relativity::InvalidRangeFormatError
  end

  it "checks separator" do
    lambda {DayTimeRange.normalize("8..10", :separator => "to")}.should raise_error Relativity::InvalidRangeFormatError
  end

  it "with nil returns nil" do
    DayTimeRange.normalize(nil).should be_nil
  end

end
