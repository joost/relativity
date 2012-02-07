require 'spec_helper'

describe DayTimeRange do

  context "output" do

    it 'does "HH:MM:SS until HH:MM:SS" for to_s' do
      dtr = DayTimeRange.new("22 until 06:30")
      dtr.to_s.should match(/\A\d\d:\d\d:\d\d until \d\d:\d\d:\d\d\Z/)
    end

    it "does correct hours, minutes, seconds for to_s" do
      dtr = DayTimeRange.new("22 until 06:30")
      dtr.to_s.should == "22:00:00 until 06:30:00"
    end

  end
end
