
class Complement

  def self.of_dna(rna)
    complements = {'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}
    complement = ''
    rna.each_char do |base|
      return '' unless complements.include? base
      complement += complements[base]
    end
    return complement
  end

end

module BookKeeping
  VERSION = 4
end
