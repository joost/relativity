module DayTime::New

  attr_reader :seconds_since_midnight

  def initialize(first = (no_args = true; nil), minutes = nil, seconds = nil, nano_seconds = nil)
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
      raise Relativity::InvalidFormatError unless no_args
      t = Time.new
      hh = t.hour
      mm = t.min
      ss = t.sec
      nn = t.nsec
    end
    @seconds_since_midnight = DayTime::Conversions.seconds_since_midnight(hh,mm,ss,nn)
  end

private

  def hh_mm_ss_from_string(input)
    r = Regexp.new(self.class.matcher)
    input.strip!
    matchdata = r.match(input)
    raise Relativity::InvalidFormatError if matchdata.nil?
    return [matchdata[:hh].to_i, matchdata[:mm].to_i, matchdata[:ss].to_i]
  end

end
