# frozen_string_literal: true

;# mathn/rational
module Math::N
  refine ::Rational do
    # Returns the canonicalized numerator if the denominator is one.
    # Otherwise returns +self+.
    def canonicalize
      if denominator == 1
        numerator.canonicalize
      else
        self
      end
    end
  end
end
