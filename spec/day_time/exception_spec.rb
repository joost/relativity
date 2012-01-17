require 'spec_helper'

describe DayTime do

  it "has a Relativity::InternalError exception class" do
    lambda { Relativity::InternalError }.should_not raise_error
  end

end
