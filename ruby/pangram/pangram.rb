require 'Set'

class Pangram

  def self.is_pangram?(string)
    return Set.new('a'..'z').subtract(string.downcase.chars).size == 0
  end

end

module BookKeeping
  VERSION = 2
end
