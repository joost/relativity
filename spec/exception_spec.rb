require 'spec_helper'

module Relativity

  describe "Exceptions" do

    it "InternalError derived from RuntimeError" do
      Relativity::InternalError.new.should be_a(RuntimeError)
    end

    it "FormatError derived from ArgumentError" do
      Relativity::FormatError.new.should be_a(ArgumentError)
    end

    it "InvalidFormatError derived from FormatError" do
      Relativity::InvalidFormatError.new.should be_a(Relativity::FormatError)
    end

    it "InvalidRangeFormatError derived from FormatError" do
      Relativity::InvalidRangeFormatError.new.should be_a(Relativity::FormatError)
    end

    it "InvalidRangeFormatError accepts a hash with separator" do
      Relativity::InvalidRangeFormatError.new(:separator => "abcd") #should_not raise_error
    end

    it "InvalidRangeFormatError gives a tailured message" do
      e = Relativity::InvalidRangeFormatError.new(:separator => "abcd")
      e.message.should == 'Maybe the range separator was not set correctly? Separator used was "abcd"'
    end

  end
end
