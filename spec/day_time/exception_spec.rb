require 'spec_helper'

describe Relativity::InternalError do

  it "inherits from StandardError" do
    subject.should be_a(StandardError)
  end

  it "raised for hours out of bound" do
    day_time = DayTime.new
    day_time.instance_variable_set(:@seconds_since_midnight, -100_000)
    lambda { day_time.hours }.should raise_error(Relativity::InternalError, 'hours is out of bound : -28')
  end

end
