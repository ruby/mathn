# frozen_string_literal: true

# mathn/rational
module Math::N
  refine ::Rational do
    def canonicalize
      if denominator == 1
        numerator.canonicalize
      else
        self
      end
    end
  end
end
