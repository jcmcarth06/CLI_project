class AnatomicalIndex

  @@all = []

  attr_accessor :extinctSpecies, :warpCapableSpecies, :extraGalacticSpecies, :humanoidSpecies, :reptilianSpecies, :nonCorporealSpecies, :shapeshiftingSpecies, :spaceborneSpecies, :telepathicSpecies, :transDimensionalSpecies, :alternateReality 
  # keep track of the species list and attributes
  def initialize 
    @@all << self
  end

  def self.all
    @@all
  end



end

