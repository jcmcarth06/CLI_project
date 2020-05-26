class API
  # make calls to our API
  # what I write will guide my 
  # attributes an will be used as
  # attr_accessors in anatomical class

  def self.search_index

    url = 'http://stapi.co/api/v1/rest/species/search'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    hash = JSON.parse(response)
    array_of_species = hash["species"]
    
  end


end
