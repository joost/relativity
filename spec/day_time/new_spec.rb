require 'spec_helper'

describe DayTime do

  it "new builds a DayTime" do
    lambda { subject }.should_not raise_error
  end

  it "new creates a DayTime close to now" do
    dt_s = subject.seconds_since_midnight
    t = Time.new
    t_s = (t.hour*60 + t.min)*60 + t.sec + t.nsec/1E9 # seconds_since_midnight from Time
    (((t_s-dt_s).abs+2)%(24*60*60)).should be <= 4
  end

  it "new with argument hours" do
    dt = DayTime.new(20)
    dt.hours.should == 20
    dt.minutes.should == 0
    dt.seconds.should == 0
    dt.nano_seconds.should == 0
  end

  it "new with argument minutes" do
    dt = DayTime.new(10,25)
    dt.minutes.should == 25
    dt.seconds.should == 0
    dt.nano_seconds.should == 0
  end

  it "new with argument seconds" do
    dt = DayTime.new(10,37,45)
    dt.seconds.should == 45
    dt.nano_seconds.should == 0
  end

  it "new with argument nano_seconds" do
    dt = DayTime.new(0,23,45,457834889)
    dt.nano_seconds.should == 457834889
  end

  it 'new with string argument "8"' do
    dt = DayTime.new("8")
    dt.hours.should == 8
    dt.minutes.should == 0
    dt.seconds.should == 0
    dt.nano_seconds.should == 0
  end

  it 'new with string argument "8:35"' do
    dt = DayTime.new("8:35")
    dt.hours.should == 8
    dt.minutes.should == 35
    dt.seconds.should == 0
    dt.nano_seconds.should == 0
  end

  it 'new with string argument "8:35:30"' do
    dt = DayTime.new("8:35:30")
    dt.hours.should == 8
    dt.minutes.should == 35
    dt.seconds.should == 30
    dt.nano_seconds.should == 0
  end

  it 'new with string does implicit strip' do
    pending ("TODO")
    dt = DayTime.new(" 8:35:30 ")
    dt.hours.should == 8
    dt.minutes.should == 35
  end

  it 'new with string rejects too much separators' do
    pending ("TODO")
    lambda { DayTime.new("8:35:30:45") }.should raise_error Relativity::InvalidFormat
    # this could inherit from InvalidArgument ?
  end

end
