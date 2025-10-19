# frozen_string_literal: true

require "cmath"
require_relative "mathn/complex"
require_relative "mathn/rational"

##
# = mathn
#
# mathn serves to make mathematical operations more precise in Ruby
# and to integrate other mathematical standard libraries.
#
# Without mathn:
#
#   using Math::N
#   3 / 2 => 1 # Integer
#
# With mathn:
#
#   using Math::N
#   3 / 2 => 3/2 # Rational
#
# mathn keeps value in exact terms.
#
# Without mathn:
#
#   20 / 9 * 3 * 14 / 7 * 3 / 2 # => 18
#
# With mathn:
#
#   using Math::N
#   20 / 9 * 3 * 14 / 7 * 3 / 2 # => 20
#
#
# When you require 'mathn', the libraries for CMath is also loaded.
#
# == Copyright
#
# Author: Keiju ISHITSUKA (SHL Japan Inc.)

module Math::N
  # The version string
  VERSION = "0.2.0"

  refine ::Numeric do
    alias canonicalize itself
  end

  using self # for canonicalize methods

  def +(other) super.canonicalize end
  def -(other) super.canonicalize end
  def *(other) super.canonicalize end
  def /(other) super.canonicalize end
  def quo(other) super.canonicalize end
  def **(other) super.canonicalize end

  # Transplant per methods.
  canon = public_instance_methods(false).map do |n, h|
    [n, instance_method(n)]
  end
  for klass in [::Integer, ::Rational, ::Complex]
    refine klass do
      canon.each {|n, m| define_method(n, m)}
    end
  end

  ##
  # Enhance Integer's division to return more precise values from
  # mathematical expressions.
  refine ::Integer do

    ##
    # +/+ defines the Rational division for Integer.
    #
    #   require 'mathn'
    #   2/3*3                   # => 0
    #   (2**72) / ((2**70) * 3) # => 1
    #
    #   using Math::N
    #   2/3*3                   # => 2
    #   (2**72) / ((2**70) * 3) # => 4/3
    alias / quo
  end

  math = refine ::Math do
    module_function

    ##
    # Computes the square root of +a+.  It makes use of Complex and
    # Rational to have no rounding errors if possible.
    #
    # Standard Math module behaviour:
    #   Math.sqrt(4/9)     # => 0.0
    #   Math.sqrt(4.0/9.0) # => 0.6666666666666666
    #   Math.sqrt(- 4/9)   # => Errno::EDOM: Numerical argument out of domain - sqrt
    #
    # When using 'Math::N', this is changed to:
    #
    #   require 'mathn'
    #   using Math::N
    #   Math.sqrt(4/9)      # => 2/3
    #   Math.sqrt(4.0/9.0)  # => 0.666666666666666
    #   Math.sqrt(- 4/9)    # => Complex(0, 2/3)

    def sqrt(a)
      return super unless a.respond_to?(:negative?)
      return a if a.respond_to?(:nan?) and a.nan?
      negative = a.negative?

      # Compute square root of a non negative number.
      case a
      when Float
        a = super(a.abs)
      when Rational
        a = sqrt(a.numerator.abs).quo sqrt(a.denominator.abs)
      else
        rt = Integer.sqrt(a = a.abs)
        a = rt * rt == a ? rt : super(a)
      end
      negative ? Complex(0, a) : a
    end

    ##
    # Computes the cubic root of +a+.  It makes use of Complex and
    # Rational to have no rounding errors if possible.
    #
    # Standard Math module behaviour:
    #   Math.cbrt(8/27)         # => 0.0
    #   Math.cbrt(8.0/27.0)     # => 0.666666666666666
    #   Math.cbrt(- 8/27)       # => -1.0
    #
    # When using 'Math::N', this is changed to:
    #
    #   require 'mathn'
    #   using Math::N
    #   Math.cbrt(8/27)         # => (2/3)
    #   Math.cbrt(8.0/27.0)     # => 0.666666666666666
    #   Math.cbrt(-8/27)        # => (-2/3)

    def cbrt(a)
      case a
      when Integer
        rt = super
        rt ** 3 == a ? Integer(rt) : rt
      when Rational
        cbrt(a.numerator).quo cbrt(a.denominator)
      when Complex
        a ** (1/3r)
      else
        super
      end
    end
  end

  # Transplant module functions.
  refine ::Math.singleton_class do
    math.private_instance_methods(false).each do |m|
      next unless math.respond_to?(m)
      public define_method(m, Math.instance_method(m))
    end
  end
end
