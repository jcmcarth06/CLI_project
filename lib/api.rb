
class API
  # make calls to our API 
  # what I write will guide my 
  # properties an will be used as
  # attr_accessors in anatomical class

  def self.search_index(searchValue)

    url = 'http://stapi.co/api/v1/rest/species/search'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    hash = JSON.parse(response)
    array_of_species = hash["species"] #iterate so i can look at one species at a time; call species.new 
                                        # "birthing a species from the factory", save it as a word "species_instance"
                                    # call setter method to name quadrant/ properties, etc.
                                    # iterate over array_of_species for hash, then iteate over that internal hash in th array 
                                    # |key, value|, add every true value into species_instace
    array_of_properties.each do |properties_hash|
      property_instance = Property.new
                
    end
  end

   
  # def self.buildarray_of_(properties_hash)
  #   properties = array.new(12) #limit number of loops to seach the properties list
  #   properties.length.times do |i|
  #     if species_hash["extinctSpecies" + i.to_s] != false
  #         properties[i] = species_hash["extinctSpecies" + i.to_s]
  #       species_hash["warpCapableSpecies" + i.to_s] != false
  #         properties[i] = species_hash["warpCapableSpecies" + i.to_s]
  #       species_hash["extraGalacticSpecies" + i.to_s] != false
  #         properties[i] = species_hash["extraGalacticSpecies" + i.to_s]
  #       species_hash["humanoidSpecies" + i.to_s] != false
  #         properties[i] = species_hash["humanoidSpecies" + i.to_s]
  #       species_hash["reptilianSpecies" + i.to_s] != false
  #         properties[i] = species_hash["reptilianSpecies" + i.to_s]
  #         species_hash["nonCorporealSpecies" + i.to_s] != false
  #         properties[i] = species_hash["nonCorporealSpecies" + i.to_s]
  #       species_hash["shapeshiftingSpecies" + i.to_s] != false
  #         properties[i] = species_hash["shapeshiftingSpecies" + i.to_s]
  #       species_hash["spaceborneSpecies" + i.to_s] != false
  #         properties[i] = species_hash["spaceborneSpecies" + i.to_s]
  #       species_hash["telepathicSpecies" + i.to_s] != false
  #         properties[i] = species_hash["telepathicSpecies" + i.to_s]
  #       species_hash["transDimensionalSpecies" + i.to_s] != false
  #         properties[i] = species_hash["transDimensionalSpecies" + i.to_s]
  #       species_hash["alternateReality" + i.to_s] != false
  #         properties[i] = species_hash["alternateReality" + i.to_s]
  #     end
  #   end
  # end
  

end
