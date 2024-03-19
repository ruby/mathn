# frozen_string_literal: true

# mathn/complex
module Math::N
  refine ::Complex do
    def canonicalize
      if imag.zero?
        real.canonicalize
      else
        self
      end
    end
  end
end
