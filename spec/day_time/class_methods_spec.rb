require 'spec_helper'

describe DayTime, "normalize" do

  it "normalize with 1 argument" do
    DayTime.normalize("8").should == "08:00:00"
  end

  it "incorrect entry raises error" do
    lambda {DayTime.normalize("A")}.should raise_error Relativity::InvalidFormatError
  end

  it "with nil returns nil" do
    DayTime.normalize(nil).should be_nil
  end

end
