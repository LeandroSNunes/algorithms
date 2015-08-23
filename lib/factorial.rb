module Factorial
  def self.run!(n)
    puts (1..n).inject { |prod, i| prod * i }
  end
end
