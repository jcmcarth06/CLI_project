class API 

  def self.search_index
    url = 'http://stapi.co/api/v1/rest/species/search'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    hash = JSON.parse(response)
    array_of_species = hash["species"] 
    array_of_species.each do |species_hash|
      species_instance = Species.new
      species_instance.name = species_hash["name"]
      species_instance.extinctSpecies = species_hash["extinctSpecies"]
      species_instance.quadrant = species_hash["quadrant"]
      species_instance.homeworld = species_hash["homeworld"]
      species_instance.warpCapableSpecies = species_hash["warpCapableSpecies"]
      species_instance.extraGalacticSpecies = species_hash["extraGalacticSpecies"]
      species_instance.humanoidSpecies = species_hash["humanoidSpecies"]
      species_instance.reptilianSpecies = species_hash["reptilianSpecies"]
      species_instance.nonCorporealSpecies = species_hash["nonCorporealSpecies"]
      species_instance.shapeshiftingSpecies = species_hash["shapeshiftingSpecies"]
      species_instance.spaceborneSpecies = species_hash["spaceborneSpecies"]
      species_instance.telepathicSpecies = species_hash["telepathicSpecies"]
      species_instance.transDimensionalSpecies = species_hash["transDimensionalSpecies"]
      species_instance.alternateReality = species_hash["alternateReality"]
      if !species_hash["quadrant"]
        species_instance.quadrant = {"name"=> "Unknown"}
      end
      if !species_hash["homeworld"]
        species_instance.homeworld = {"name"=> "Unknown"}
      end
    end
  end

  def self.searchSpecies(input)  #this is how the user will interact with the program, allowing the input to be lowercase
    return Species.all.select {|s| s.name.downcase.start_with? input.downcase}
  end

  def self.searchQuadrant(input)
    return Species.all.select {|s| s.quadrant["name"].downcase == input.downcase}
  end

end