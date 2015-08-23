module Fibonacci
  def self.run!(n, sequence=[1])
    n.times do
      current_number, last_number = sequence.last(2)
      sequence << current_number + (last_number || 0)
    end
    puts sequence
  end
end
