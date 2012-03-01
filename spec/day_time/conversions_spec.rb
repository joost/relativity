require 'spec_helper'
require 'bigdecimal/util'

describe DayTime do

  it "hours" do
    (((subject.hours - Time.new.hour).abs+1)%24).should be <= 2
  end

  it "hours should be Integer" do
    subject.hours.should be_kind_of(Integer)
  end

  it "minutes" do
    (((subject.minutes - Time.new.min).abs+1)%60).should be <= 2
  end

  it "minutes should be Integer" do
    subject.minutes.should be_kind_of(Integer)
  end

  it "seconds" do
    (((subject.seconds - Time.new.sec).abs+2)%60).should be <= 4
  end

  it "seconds should be Integer" do
    subject.seconds.should be_kind_of(Integer)
  end

  it "nano_seconds should be Integer" do
    subject.nano_seconds.should be_kind_of(Integer)
  end

  it "seconds_since_midnight" do
    subject.seconds_since_midnight # should_not raise_error
  end

  it "seconds_since_midnight should be BigDecimal" do
    subject.seconds_since_midnight.should be_kind_of(BigDecimal)
  end

  context "seconds since midnight" do

    it "zero is correct" do
      DayTime::Conversions.seconds_since_midnight(0,0,0,0).should == "0".to_d
    end

    it "hours are correct" do
      DayTime::Conversions.seconds_since_midnight(1,0,0,0).should == "3600".to_d
    end

    it "minutes are correct" do
      DayTime::Conversions.seconds_since_midnight(0,1,0,0).should == "60".to_d
    end

    it "seconds are correct" do
      DayTime::Conversions.seconds_since_midnight(0,0,1,0).should == "1".to_d
    end

    it "nanoseconds are correct" do
      DayTime::Conversions.seconds_since_midnight(0,0,0,1000).should == "0.000001".to_d
    end

  end
end
