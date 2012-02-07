class DayTime

  require 'bigdecimal'
  require 'relativity/day_time/new'
  require 'relativity/day_time/conversions'
  require 'relativity/day_time/comparison'
  include DayTime::Comparison
  include DayTime::New
  include DayTime::Conversions

  def self.default_separator
    ':'
  end

end
