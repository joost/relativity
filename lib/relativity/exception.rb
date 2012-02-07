module Relativity

  class InternalError < RuntimeError
  end

  class InvalidFormatError < ArgumentError
  end

  class InvalidRangeFormatError < ArgumentError
    def initialize(options = {})
    end
  end

end
