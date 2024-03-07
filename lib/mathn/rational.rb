# frozen_string_literal: true

# mathn/rational
module Math::Nat
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
