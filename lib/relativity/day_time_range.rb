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

  def self.separator
    " until "
  end

private

  def start_end_from_string(input, options)
    separator = (options && options[:separator]) || self.class.separator
    separator = Regexp.escape(separator)
    matcher = '\A(?<start>.+)' + separator + '(?<end>.+)\Z'
    r = Regexp.new(matcher)
    matchdata = r.match(input)
    return [DayTime.new(matchdata[:start]), DayTime.new(matchdata[:end])]
  end

end
