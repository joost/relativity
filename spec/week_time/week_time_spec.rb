require 'spec_helper'

describe WeekTime do

  it "new builds a WeekTime" do
    subject # should_not raise_error
  end

  it "seconds_since_sunday_midnight" do
    subject.seconds_since_sunday_midnight # should_not raise_error
  end

  it "new creates a WeekTime close to now" do
    wt_s = subject.seconds_since_sunday_midnight
    t = Time.new
    day_time_s = (t.hour*60 + t.min)*60 + t.sec + t.nsec/1E9
    week_day_d = t.wday #0..6 0 is Sunday
    week_day_s = week_day_d * 24 * 3600
    week_time_s = day_time_s + week_day_s
    (((week_time_s - wt_s).abs+2)%(7*24*3600)).should be <= 4
  end

end
