defmodule RationalTest do
  use ExUnit.Case, async: true
  doctest Rational

  alias Rational, as: R

  test "Rational.new" do
    assert R.new(2,3)   == %Rational{numer: 2, denom: 3}
    assert R.new(2,3)   == R.new(6,9)
    assert R.new(-6,9)  == %Rational{numer: -2, denom: 3}
    assert R.new(-6,9)  == R.new(2,-3)
    assert R.new(-6,-9) == R.new(2,3)
    assert R.new(0,2)   == R.new(0,1)

    assert_raise ArithmeticError, fn -> R.new(1,0) end
  end

end
