require 'spec_helper'

module Relativity

  describe "Exceptions" do

    it "InternalError derived from RuntimeError" do
      Relativity::InternalError.new.should be_a(RuntimeError)
    end

    it "InvalidFormatError derived from ArgumentError" do
      Relativity::InvalidFormatError.new.should be_a(ArgumentError)
    end

    it "InvalidRangeFormatError derived from ArgumentError" do
      Relativity::InvalidRangeFormatError.new.should be_a(ArgumentError)
    end

    it "InvalidRangeFormatError accepts a hash with separator" do
      lambda {e = Relativity::InvalidRangeFormatError.new(:separator => "abcd")}.
        should_not raise_error
    end

    it "InvalidRangeFormatError gives a tailured message" do
      e = Relativity::InvalidRangeFormatError.new(:separator => "abcd")
      e.message.should == 'Maybe the range separator was not set correctly? Separtor used was "abcd"'
    end

  end
end
