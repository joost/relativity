require 'spec_helper'

describe DayTimeRange do

  context "separator" do

    it "until should be in the marshal" do
      Marshal.dump(DayTimeRange.new("22 until 06:30")).should match(/until/)
    end

    it "test_sep should be in the marshal" do
      Marshal.dump(DayTimeRange.new("22 test_sep 06:30", :separator => ' test_sep ')).should match(/ test_sep /)
    end

  end
end
