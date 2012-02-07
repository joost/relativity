module Relativity

  class InternalError < RuntimeError
  end

  class InvalidFormatError < ArgumentError
  end

  class InvalidRangeFormatError < ArgumentError
    def initialize(options = {})
      @options = options
    end
    def to_s
      "Maybe the range separator was not set correctly? Separator used was \"#{@options[:separator]}\""
    end
  end

end
