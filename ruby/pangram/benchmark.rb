require 'benchmark/ips'
require_relative 'pangram'

Benchmark.ips do |x|

  x.config(:time => 5, :warmup => 2)

  x.report("regex") do
    str = 'the quick brown fox jumps over the lazy dog'
    Pangram.is_pangram_regex?(str)
  end

  x.report("arr") do
    str = 'the quick brown fox jumps over the lazy dog'
    Pangram.is_pangram_array?(str)
  end

end
