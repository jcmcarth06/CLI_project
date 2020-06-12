class Species

  @@all = []

  attr_accessor :extinctSpecies, :warpCapableSpecies, :extraGalacticSpecies, :humanoidSpecies, :reptilianSpecies, :nonCorporealSpecies, :shapeshiftingSpecies, :spaceborneSpecies, :telepathicSpecies, :transDimensionalSpecies, :alternateReality, :unnamedSpecies, :name
  attr_writer :quadrant, :homeworld

  def initialize(species_hash)
    species_hash.each {|key, value| self.send("#{key}=", value) if self.respond_to?("#{key}=")}
    @@all << self
  end

  def homeworld
    @homeworld || {"name"=> "Unknown"}
  end

  def quadrant
    @quadrant || {"name"=> "Unknown"}
  end

  def self.all
    @@all
  end

end

