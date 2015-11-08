defmodule Rational do
  @moduledoc """
  Perform arithmetic with rational numbers.

      iex> ra = Rational.new(4,3)
      %Rational{numer: 4, denom: 3}
      iex> rb = Rational.sub ra, Rational.new(2,3)
      %Rational{numer: 2, denom: 3}
      iex> Rational.approx rb
      0.6666666666666666

  Thanks to the Inspect protocol, rationals will actually appear in friendly
  "%Rational{1/2}" format when inspected.
  """

  import Kernel, except: [div: 2]

  defstruct [:numer, :denom]
  @type t :: %Rational{numer: integer, denom: non_neg_integer}

  @doc """
  Construct a new rational. It will be reduced to its simplest terms.

      iex> Rational.new(4,8)
      %Rational{numer: 1, denom: 2}
  """
  @spec new(integer, non_neg_integer) :: t
  def new(n, d) do
    g = gcd(n, d)
    %Rational{numer: Kernel.div(n,g), denom: Kernel.div(d,g)}
  end

  @doc """
  Compare two rationals.

      iex> Rational.equal? Rational.new(1,2), Rational.new(1,8) 
      false
  """
  @spec equal?(t, t) :: boolean
  def equal?(ra, rb) do
    ra.numer * ra.denom == rb.numer * rb.denom
  end

  @doc """
  Add two rationals.

      iex> Rational.add Rational.new(1,2), Rational.new(4,5)
      %Rational{numer: 13, denom: 10}
  """
  @spec add(t, t) :: t
  def add(ra, rb) do
    new(ra.numer * rb.denom + rb.numer * ra.denom,
        ra.denom * rb.denom)
  end

  @doc """
  Subtract two rationals.

      iex> Rational.sub Rational.new(1,2), Rational.new(4,5)
      %Rational{numer: -3, denom: 10}
  """
  @spec sub(t, t) :: t
  def sub(ra, rb) do
    new(ra.numer * rb.denom - rb.numer * ra.denom,
        ra.denom * rb.denom)
  end

  @doc """
  Multiply two rationals.

      iex> Rational.mul Rational.new(1,2), Rational.new(3,4)
      %Rational{numer: 3, denom: 8}
  """
  @spec mul(t, t) :: t
  def mul(ra, rb) do
    new(ra.numer * rb.numer,
        ra.denom * rb.denom)
  end

  @doc """
  Divide two rationals.

      iex> Rational.div Rational.new(1,2), Rational.new(3,4)
      %Rational{numer: 2, denom: 3}
  """
  @spec div(t, t) :: t
  def div(ra, rb) do
    new(ra.numer * rb.denom,
        ra.denom * rb.numer)
  end

  @doc """
  Approximate rational into a float.

      iex> Rational.approx Rational.new(1,2)
      0.5
      iex> Rational.approx Rational.new(1,3)
      0.3333333333333333
  """
  @spec approx(t) :: float
  def approx(r), do: r.numer/r.denom

  @doc """
  Raise a rational to the given power.

      iex> Rational.pow Rational.new(2,3), 2
      %Rational{numer: 4, denom: 9}
      iex> Rational.pow Rational.new(2,3), 0
      1
  """
  @spec pow(t, integer) :: t | integer
  def pow(r, 0), do: 1
  def pow(r, 1), do: r
  def pow(r, n) when n > 1 do
    new( trunc(:math.pow(r.numer, n)),
         trunc(:math.pow(r.denom, n)))
  end
  def pow(r, n) when n < 0 do
    new( trunc(:math.pow(r.denom, n)),
         trunc(:math.pow(r.numer, n)))
  end

  defp gcd(a,0), do: a
  defp gcd(a,b), do: gcd(b, mod(a,b))

  defp mod(_a, 0), do: 0
  defp mod(a, b) do
    case rem(a, b) do
      r when r < 0 -> b + r
      r            -> r
    end
  end
end

defimpl Inspect, for: Rational do
  def inspect(r, _opts) do
    "%Rational{#{r.numer}/#{r.denom}}"
  end
end


