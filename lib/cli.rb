require 'pry'
class CLI
  def start
    Logo.logo 
    puts "Welcome to the Star Trek Species Index
    " 
    API.search_index
    self.menu
  end

  def menu
    puts "Enter '1' to search the alphabetical database or '2' to search by quadrant.\n"
    user_input = gets.strip.downcase
    if user_input == "1" 
      self.letter_menu
    elsif user_input == "2"
      self.quadrant_menu
    else 
      puts "There is no database for the input you entered. Please provide a valid entry.\n"
      self.menu
    end
  end

  def quadrant_menu
    puts "Please select a quadrant index number:
        1. Alpha
        2. Beta
        3. Gamma
        4. Delta"
    user_input = gets.strip.downcase
    selection = ""
    if user_input == "1"
      selection = "Alpha Quadrant"
    elsif user_input == "2"
      selection = "Beta Quadrant"
    elsif user_input == "3"
      selection = "Gamma Quadrant"
    elsif user_input == "4"
      selection = "Delta Quadrant"
    else 
      puts "\nThere is no data for the input you entered. Please provide a valid entry."
      self.quadrant_menu
    end
    arr = API.searchQuadrant(selection)
    if arr.length == 0 
      puts "\nThere exist no species in the quadrant you entered. Please provide a valid entry."
      self.quadrant_menu
    end
    puts 
    arr.each_with_index { |x, idx| puts "#{idx + 1}. #{x.name}"}
    self.ask_user_for_species_input(arr)
  end
  

  def letter_menu
    puts "\nPlease enter a letter to display a list of corresponding species whose name begins with that letter."
    user_input = gets.strip.downcase
    arr = API.searchSpecies(user_input)
    if arr.length == 0 
      puts "\nThere no species in the index for the letter you entered. Please provide a valid entry."
      self.letter_menu
    end
    arr.each_with_index { |x, idx| puts "#{idx + 1}. #{x.name}"}
    self.ask_user_for_species_input(arr)
  end

  def ask_user_for_species_input(list_by_letter)
    puts "\nPlease select an index number from the list to learn more about the species."
    index = gets.strip.to_i - 1
    species_data = list_by_letter[index]
    puts "Name: #{species_data.name}\n
      Homeworld: #{species_data.homeworld["name"]}\n
      Quadrant: #{species_data.quadrant["name"]}\n
          Extinct: #{species_data.extinctSpecies}
          Warp-Capable: #{species_data.warpCapableSpecies}
          Extra-Galactic: #{species_data.extraGalacticSpecies}
          Humanoid: #{species_data.humanoidSpecies}
          Reptilian: #{species_data.reptilianSpecies}
          Non-Corporeal: #{species_data.nonCorporealSpecies}
          Shapeshifter: #{species_data.shapeshiftingSpecies}
          Spaceborne: #{species_data.spaceborneSpecies}
          Telepathic: #{species_data.telepathicSpecies}
          Trans-Dimensional: #{species_data.transDimensionalSpecies}
          Alternate Reality: #{species_data.alternateReality}"
    self.return_to_menu
  end

  def return_to_menu
    puts "\nTo return to the Main Menu enter 'menu'."
    user_input = gets.strip.downcase
    if user_input == "menu"
      self.menu
    end
  end

end
