require 'spec_helper'

describe DayTime do

  it "== reports exact equality for hours" do
    dt_1 = DayTime.new(8)
    dt_2 = DayTime.new(8)
    dt_1.should == dt_2
  end

  it "== reports exact equality for all arguments" do
    dt_1 = DayTime.new(0,23,45,457834889)
    dt_2 = DayTime.new(0,23,45,457834889)
    dt_1.should == dt_2
  end

end
