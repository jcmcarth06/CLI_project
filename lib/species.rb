class Species

  @@all = []

  attr_accessor :extinctSpecies, :homeworld, :quadrant, :warpCapableSpecies, :extraGalacticSpecies, :humanoidSpecies, :reptilianSpecies, :nonCorporealSpecies, :shapeshiftingSpecies, :spaceborneSpecies, :telepathicSpecies, :transDimensionalSpecies, :alternateReality, :unnamedSpecies, :name
  # keep track of the species list and attributes
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end

end

