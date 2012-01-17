class WeekTime

  require 'bigdecimal'
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

    seconds_since_midnight = ((hh * 3600) + (mm * 60) + ss + BigDecimal(nn)/BigDecimal(1000000000))%(24*3600)
    @seconds_since_sunday_midnight = week_day_d * 24 * 3600 + seconds_since_midnight
  end

end
