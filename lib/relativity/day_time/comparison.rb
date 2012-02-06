module DayTime::Comparison

  def ==(other)
    self.seconds_since_midnight == other.seconds_since_midnight
  end

end
