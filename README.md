# Rational

Elixir library for working with rational numbers.

    iex> ra = Rational.new(4,3)
    %Rational{4/3}

    iex> rb = Rational.sub ra, Rational.new(2,3)
    %Rational{2/3}

    iex> Rational.approx rb
    0.6666666666666666

    iex> Rational.mul rb, Rational.new(4,9)
    %Rational{8/27}

Implements:

* `add`, `sub`, `mul`, `div`
* `approx`
* `pow`
* `gcd`


