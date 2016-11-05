require 'set'

class Sieve

  attr_accessor :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    range = Set.new(2..limit)

    2.upto(limit) do |i|
      multiple_count = (limit / i).floor
      2.upto(multiple_count) do |j|
        range.delete(i*j)
      end
    end
    return range.to_a
  end

end

module BookKeeping
  VERSION = 1
end
