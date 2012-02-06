class DayTime

  require 'bigdecimal'
  require 'relativity/day_time/comparison'
  include DayTime::Comparison

  attr_reader :seconds_since_midnight

  def initialize(first= nil, minutes = nil, seconds = nil, nano_seconds = nil)
    super()
    case first
    when Integer
      hh = first #hours
      mm = minutes || 0
      ss = seconds || 0
      nn = nano_seconds || 0
    when String
      hh, mm, ss = hh_mm_ss_from_string(first)
      nn = 0
    else
      t = Time.new
      hh = t.hour
      mm = t.min
      ss = t.sec
      nn = t.nsec
    end
    @seconds_since_midnight = ((hh * 3600) + (mm * 60) + ss + BigDecimal(nn)/BigDecimal(1000000000))%(24*3600)
  end

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

  def hh_mm_ss_from_string(input)
    separator = self.class.separator
    separator = Regexp.escape(separator) # e.g. separator is '.'
    match_hh = '(?<hh>\d\d?)'
    match_mm = '(' + separator + '(?<mm>\d\d?))?'
    match_ss = '(' + separator + '(?<ss>\d\d?))?'
    matcher = '\A' + match_hh + match_mm + match_ss + '\Z'
    r = Regexp.new(matcher)
    matchdata = r.match(input)
    return [matchdata[:hh].to_i, matchdata[:mm].to_i, matchdata[:ss].to_i]
  end

end
