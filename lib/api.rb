class API 

  def self.build_properties_array(species_hash) #building a hash of 
    properties = Species.new(12)
    properties.length.times do |i|
      if species_hash["warpCapableSpecies" + i.to_s] != false  #adding only the true values per loop
        property[i] = species_hash["warpCapableSpecies" + i.to_s] #use shovel method instead? 
                          #do I need to do this ^^ for each property instance?
      end
    end
    return properties #return the list of true values after all 12 loops are complete
  end

  def self.search_index
    url = 'http://stapi.co/api/v1/rest/species/search'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    hash = JSON.parse(response)
    array_of_species = hash["species"] #iterate so i can look at one species at a time; call species.new
                                        # "birthing a species from the factory", save it as a word "species_instance"
                                    # call setter method to name quadrant/ properties, etc.
                                    # iterate over array_of_species for hash, then iteate over that internal hash in th array
                                    # |key, value|, add every true value into species_instace
    array_of_species.each do |species_hash|
      species_instance = Species.new
      species_instance.extinctSpecies = species_hash["extinctSpecies"]
      species_instance.name = species_hash["name"]
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
    end
  end

  def self.searchSpecies(input)  #this is how the user will interact with the program, allowing the input to be lowercase
    return Species.all.select {|s| s.name.downcase.start_with? input.downcase}
  end

end