class Species

  @@all = []

  attr_accessor :extinctSpecies, :homeworld, :quadrant, :warpCapableSpecies, :extraGalacticSpecies, :humanoidSpecies, :reptilianSpecies, :nonCorporealSpecies, :shapeshiftingSpecies, :spaceborneSpecies, :telepathicSpecies, :transDimensionalSpecies, :alternateReality, :unnamedSpecies, :name
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end

end

