require 'spec_helper'

describe Relativity::InternalError do

  it "inherits from StandardError" do
    subject.should be_a(StandardError)
  end

end
