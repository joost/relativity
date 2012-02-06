class DayTimeRange

  def initialize(first, second = nil)
    super()
    @start_day_time = DayTime.new(8)
    @end_day_time = DayTime.new(11)
  end

  def start
    @start_day_time
  end

  def end
    @end_day_time
  end

end
