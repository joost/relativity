module Relativity

  class InternalError < ::RuntimeError
  end

  class FormatError < ::ArgumentError
  end

  class InvalidFormatError < FormatError
  end

  class InvalidRangeFormatError < FormatError
    def initialize(options = {})
      @options = options
    end
    def to_s
      "Maybe the range separator was not set correctly? Separator used was \"#{@options[:separator]}\""
    end
  end

end
