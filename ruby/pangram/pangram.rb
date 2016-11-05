
class Pangram

  ALPHABET = ('a'..'z').to_a

  def self.is_pangram?(sentence)
    pangram?(sentence)
  end

  def self.pangram?(sentence)
    (ALPHABET - sentence.downcase.chars).size.zero?
  end

end

module BookKeeping
  VERSION = 2
end
