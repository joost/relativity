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

    it 'setting the separator is used for to_s' do
      dtr = DayTimeRange.new("22 until 06:30")
      dtr.separator = '..'
      dtr.to_s.should match(/\d..\d/)
    end

    #NOTE this is an integration test (many features in 1 test)
    it 'uses the separator used for initializing also for to_s' do
      dtr = DayTimeRange.new(" 22..06:30 ", :separator => '..')
      dtr.to_s.should == "22:00:00..06:30:00"
    end

  end
end
