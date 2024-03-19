# frozen_string_literal: false
require 'test/unit'
require 'mathn'

module TestMathn
  HALF = 1/2r

  class WithoutMathn < Test::Unit::TestCase
    def test_plus
      assert_kind_of(Rational, (1/2r)+(1/2r))
      assert_kind_of(Complex, (1-1i)+1i)
    end

    def test_minus
      assert_kind_of(Rational, (1/2r)-(1/2r))
      assert_kind_of(Complex, (1+1i)-1i)
    end

    def test_mul
      assert_kind_of(Rational, 1/2r*2)
      assert_equal(0, 1/2*2)

      x = (1+1i)*(1-1i)
      assert_kind_of(Complex, x)
      assert_equal(2, x)
    end

    def test_div
      assert_kind_of(Rational, (4/3r)/(2/3r))
      assert_equal(0, (2/3)/(4/3))

      x = (2+2i)/(1+1i)
      assert_kind_of(Complex, x)
      assert_equal(2, x)
    end
  end

  class WithMathn < Test::Unit::TestCase
    using Math::N

    def test_plus
      assert_kind_of(Integer, (1/2r)+(1/2r))
      assert_kind_of(Integer, (1-1i)+1i)
    end

    def test_minus
      assert_kind_of(Integer, (1/2r)-(1/2r))
      assert_kind_of(Integer, (1+1i)-1i)
    end

    def test_mul
      assert_kind_of(Integer, 1/2r*2)
      assert_equal(1, 1/2*2)

      x = (1+1i)*(1-1i)
      assert_kind_of(Integer, x)
      assert_equal(2, x)
    end

    def test_div
      assert_kind_of(Integer, (4/3r)/(2/3r))
      assert_equal(1/2r, (2/3)/(4/3))

      x = (2+2i)/(1+1i)
      assert_kind_of(Integer, x)
      assert_equal(2, x)
    end

    def test_power
      assert_equal(1, 1**2)
      assert_kind_of(Integer, (1 << 126)**2)
      assert_equal(1, Complex(0,1)**4)
      assert_equal(1i, Complex(0,1)**5)
    end

    def test_quo
      assert_equal(1/2r, 1.quo(2) , '[ruby-core:41575]')
    end

    def test_floor
      assert_equal( 2, ( 13/5).floor)
      assert_equal( 2, (  5/2).floor)
      assert_equal( 2, ( 12/5).floor)
      assert_equal(-3, (-12/5).floor)
      assert_equal(-3, ( -5/2).floor)
      assert_equal(-3, (-13/5).floor)

      assert_equal( 2, ( 13/5).floor(0))
      assert_equal( 2, (  5/2).floor(0))
      assert_equal( 2, ( 12/5).floor(0))
      assert_equal(-3, (-12/5).floor(0))
      assert_equal(-3, ( -5/2).floor(0))
      assert_equal(-3, (-13/5).floor(0))

      assert_equal(( 13/5), ( 13/5).floor(2))
      assert_equal((  5/2), (  5/2).floor(2))
      assert_equal(( 12/5), ( 12/5).floor(2))
      assert_equal((-12/5), (-12/5).floor(2))
      assert_equal(( -5/2), ( -5/2).floor(2))
      assert_equal((-13/5), (-13/5).floor(2))
    end

    def test_ceil
      assert_equal( 3, ( 13/5).ceil)
      assert_equal( 3, (  5/2).ceil)
      assert_equal( 3, ( 12/5).ceil)
      assert_equal(-2, (-12/5).ceil)
      assert_equal(-2, ( -5/2).ceil)
      assert_equal(-2, (-13/5).ceil)

      assert_equal( 3, ( 13/5).ceil(0))
      assert_equal( 3, (  5/2).ceil(0))
      assert_equal( 3, ( 12/5).ceil(0))
      assert_equal(-2, (-12/5).ceil(0))
      assert_equal(-2, ( -5/2).ceil(0))
      assert_equal(-2, (-13/5).ceil(0))

      assert_equal(( 13/5), ( 13/5).ceil(2))
      assert_equal((  5/2), (  5/2).ceil(2))
      assert_equal(( 12/5), ( 12/5).ceil(2))
      assert_equal((-12/5), (-12/5).ceil(2))
      assert_equal(( -5/2), ( -5/2).ceil(2))
      assert_equal((-13/5), (-13/5).ceil(2))
    end

    def test_truncate
      assert_equal( 2, ( 13/5).truncate)
      assert_equal( 2, (  5/2).truncate)
      assert_equal( 2, ( 12/5).truncate)
      assert_equal(-2, (-12/5).truncate)
      assert_equal(-2, ( -5/2).truncate)
      assert_equal(-2, (-13/5).truncate)

      assert_equal( 2, ( 13/5).truncate(0))
      assert_equal( 2, (  5/2).truncate(0))
      assert_equal( 2, ( 12/5).truncate(0))
      assert_equal(-2, (-12/5).truncate(0))
      assert_equal(-2, ( -5/2).truncate(0))
      assert_equal(-2, (-13/5).truncate(0))

      assert_equal(( 13/5), ( 13/5).truncate(2))
      assert_equal((  5/2), (  5/2).truncate(2))
      assert_equal(( 12/5), ( 12/5).truncate(2))
      assert_equal((-12/5), (-12/5).truncate(2))
      assert_equal(( -5/2), ( -5/2).truncate(2))
      assert_equal((-13/5), (-13/5).truncate(2))
    end

    def test_round
      assert_equal( 3, ( 13/5).round)
      assert_equal( 3, (  5/2).round)
      assert_equal( 2, ( 12/5).round)
      assert_equal(-2, (-12/5).round)
      assert_equal(-3, ( -5/2).round)
      assert_equal(-3, (-13/5).round)

      assert_equal( 3, ( 13/5).round(0))
      assert_equal( 3, (  5/2).round(0))
      assert_equal( 2, ( 12/5).round(0))
      assert_equal(-2, (-12/5).round(0))
      assert_equal(-3, ( -5/2).round(0))
      assert_equal(-3, (-13/5).round(0))

      assert_equal(( 13/5), ( 13/5).round(2))
      assert_equal((  5/2), (  5/2).round(2))
      assert_equal(( 12/5), ( 12/5).round(2))
      assert_equal((-12/5), (-12/5).round(2))
      assert_equal(( -5/2), ( -5/2).round(2))
      assert_equal((-13/5), (-13/5).round(2))

      assert_equal( 3, ( 13/5).round(half: :even))
      assert_equal( 2, (  5/2).round(half: :even))
      assert_equal( 2, ( 12/5).round(half: :even))
      assert_equal(-2, (-12/5).round(half: :even))
      assert_equal(-2, ( -5/2).round(half: :even))
      assert_equal(-3, (-13/5).round(half: :even))

      assert_equal( 3, ( 13/5).round(0, half: :even))
      assert_equal( 2, (  5/2).round(0, half: :even))
      assert_equal( 2, ( 12/5).round(0, half: :even))
      assert_equal(-2, (-12/5).round(0, half: :even))
      assert_equal(-2, ( -5/2).round(0, half: :even))
      assert_equal(-3, (-13/5).round(0, half: :even))

      assert_equal(( 13/5), ( 13/5).round(2, half: :even))
      assert_equal((  5/2), (  5/2).round(2, half: :even))
      assert_equal(( 12/5), ( 12/5).round(2, half: :even))
      assert_equal((-12/5), (-12/5).round(2, half: :even))
      assert_equal(( -5/2), ( -5/2).round(2, half: :even))
      assert_equal((-13/5), (-13/5).round(2, half: :even))

      assert_equal( 3, ( 13/5).round(half: :up))
      assert_equal( 3, (  5/2).round(half: :up))
      assert_equal( 2, ( 12/5).round(half: :up))
      assert_equal(-2, (-12/5).round(half: :up))
      assert_equal(-3, ( -5/2).round(half: :up))
      assert_equal(-3, (-13/5).round(half: :up))

      assert_equal( 3, ( 13/5).round(0, half: :up))
      assert_equal( 3, (  5/2).round(0, half: :up))
      assert_equal( 2, ( 12/5).round(0, half: :up))
      assert_equal(-2, (-12/5).round(0, half: :up))
      assert_equal(-3, ( -5/2).round(0, half: :up))
      assert_equal(-3, (-13/5).round(0, half: :up))

      assert_equal(( 13/5), ( 13/5).round(2, half: :up))
      assert_equal((  5/2), (  5/2).round(2, half: :up))
      assert_equal(( 12/5), ( 12/5).round(2, half: :up))
      assert_equal((-12/5), (-12/5).round(2, half: :up))
      assert_equal(( -5/2), ( -5/2).round(2, half: :up))
      assert_equal((-13/5), (-13/5).round(2, half: :up))

      assert_equal( 3, ( 13/5).round(half: :down))
      assert_equal( 2, (  5/2).round(half: :down))
      assert_equal( 2, ( 12/5).round(half: :down))
      assert_equal(-2, (-12/5).round(half: :down))
      assert_equal(-2, ( -5/2).round(half: :down))
      assert_equal(-3, (-13/5).round(half: :down))

      assert_equal( 3, ( 13/5).round(0, half: :down))
      assert_equal( 2, (  5/2).round(0, half: :down))
      assert_equal( 2, ( 12/5).round(0, half: :down))
      assert_equal(-2, (-12/5).round(0, half: :down))
      assert_equal(-2, ( -5/2).round(0, half: :down))
      assert_equal(-3, (-13/5).round(0, half: :down))

      assert_equal(( 13/5), ( 13/5).round(2, half: :down))
      assert_equal((  5/2), (  5/2).round(2, half: :down))
      assert_equal(( 12/5), ( 12/5).round(2, half: :down))
      assert_equal((-12/5), (-12/5).round(2, half: :down))
      assert_equal(( -5/2), ( -5/2).round(2, half: :down))
      assert_equal((-13/5), (-13/5).round(2, half: :down))
    end

    def test_rational
      assert_equal(-5, "-5".to_r)
      assert_equal(1, "5/5".to_r)
      assert_equal(5, "5e0".to_r)
    end
  end
end
