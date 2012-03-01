class WeekTime

  require 'time'

  attr_reader :seconds_since_sunday_midnight

  def initialize(week_day_string=nil, hours = nil, minutes = nil, seconds = nil, nano_seconds = nil)
    super()
    if week_day_string
#      week_day_d =
#      hh = hours.to_i
#      mm = minutes.to_i
#      ss = seconds.to_i
#      nn = nano_seconds.to_i
    else
      t = Time.new
      week_day_d = t.wday
      hh = t.hour
      mm = t.min
      ss = t.sec
      nn = t.nsec
    end

    day_time = DayTime.new(hh,mm,ss,nn)
    @seconds_since_sunday_midnight = (week_day_d * 24 * 3600) + day_time.seconds_since_midnight
  end

end
