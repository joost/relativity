require 'spec_helper'

describe WeekTime do

  it "new builds a WeekTime" do
    lambda { subject }.should_not raise_error
  end

  it "seconds_since_sunday_midnight" do
    lambda { subject.seconds_since_sunday_midnight }.should_not raise_error
  end

end
