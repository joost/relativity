require 'spec_helper'

describe DayTimeRange do

  it "default separator is ' until '" do
    DayTimeRange.separator.should == ' until '
  end

end
