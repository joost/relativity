module DayTime::Conversions

  def hours
    hours = Integer(@seconds_since_midnight/3600).tap do |h|
      raise Relativity::InternalError, "hours is out of bound : #{h}" if (h < 0 || h > 23)
    end
  end

  def minutes
    Integer(@seconds_since_midnight / 60) % 60
  end

  def seconds
    Integer(@seconds_since_midnight) % 60
  end

  def nano_seconds
    Integer((@seconds_since_midnight % 1) * 1000000000)
  end

  def to_s
    [hours, minutes, seconds].map{|e| rjust_2_0(e.to_s)}.join(self.class.separator)
  end

  def self.separator
    ':'
  end

private

  def rjust_2_0(s)
    s.rjust(2,'0')
  end

end