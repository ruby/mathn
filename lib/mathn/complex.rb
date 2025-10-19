# frozen_string_literal: true

;# mathn/complex
module Math::N
  refine ::Complex do
    # Returns the canonicalized real number if the imaginary part is
    # zero.  Otherwise returns +self+.
    def canonicalize
      if imag.zero?
        real.canonicalize
      else
        self
      end
    end
  end
end
