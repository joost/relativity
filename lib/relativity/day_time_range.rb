class DayTimeRange

  def initialize(first, second = nil)
    super()
    @start_day_time, @end_day_time =
      case first
      when String
        start_end_from_string(first, second)
      end
  end

  def start
    @start_day_time
  end

  def end
    @end_day_time
  end

  def to_s
    start.to_s + self.class.separator + self.end.to_s
  end

  def self.separator
    " until "
  end

private

  def start_end_from_string(input, options)
    separator = (options && options[:separator]) || self.class.separator
    esc_separator = Regexp.escape(separator)
    matcher = '\A(?<start>.+)' + esc_separator + '(?<end>.+)\Z'
    r = Regexp.new(matcher)
    matchdata = r.match(input)
    raise Relativity::InvalidRangeFormatError.new(:separator => separator) if matchdata.nil?
    return [DayTime.new(matchdata[:start]), DayTime.new(matchdata[:end])]
  end

end
