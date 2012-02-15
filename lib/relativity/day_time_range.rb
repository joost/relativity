class DayTimeRange

  attr_accessor :separator

  def initialize(first, second = nil)
    super()
    # NOTE don't forget to set the @separator
    @start_day_time, @end_day_time =
      case first
      when String
        start_end_from_string(first, second)
      else
        raise InvalidRangeFormatError
      end
  end

  def start
    @start_day_time
  end

  def end
    @end_day_time
  end

  def to_s
    start.to_s + @separator + self.end.to_s
  end

  def self.normalize(*args)
    return nil if args == [nil]
    new(*args).to_s
  end

private

  def start_end_from_string(input, options)
    @separator = options && options[:separator]
    if @separator
      esc_separator = Regexp.escape(@separator)
      matcher = '\A(?<start>.+)' + esc_separator + '(?<end>.+)\Z'
    else
      matcher = '\A' +
                '(?<start>' + DayTime.internal_matcher + ')' +
                '(?<separator>[^\d]+)' +
                '(?<end>' + DayTime.internal_matcher + ')' +
                '\Z'
    end
    r = Regexp.new(matcher)
    matchdata = r.match(input)
    raise Relativity::InvalidRangeFormatError.new(:separator => @separator) if matchdata.nil?
    @separator ||= matchdata[:separator]
    return [DayTime.new(matchdata[:start]), DayTime.new(matchdata[:end])]
  end

end
