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

  def self.matcher
    matcher = '\A' + internal_matcher + '\Z'
  end

  def self.internal_matcher
    separator = default_separator
    esc_separator = Regexp.escape(separator) # e.g. separator is '.'
    match_hh = '(?<hh>\d\d?)'
    match_mm = '(' + esc_separator + '(?<mm>\d\d?))?'
    match_ss = '(' + esc_separator + '(?<ss>\d\d?))?'
    match_hh + match_mm + match_ss
  end

  def self.normalize(*args)
    return nil if args == [nil]
    new(*args).to_s
  end

end
