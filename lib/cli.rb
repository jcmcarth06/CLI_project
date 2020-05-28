require 'pry'
class CLI
  # control center for everything
  # interact with the user
  # include any puts or gets statements
  # control the flow of the program

  def start
    logo #maybe use a smaller ASCII image?
    puts "Welcome to the Star Trek Anatomical Tricorder
    
    " # maybe put this in the ASCII as well???
    API.search_index
    self.menu
  end

  def logo
    puts " 
     ________.--------------.________
    |  ||__| [_]|                    |
    |  |     [_]|                    |
    |__|_____[_]|____________________|
    | |PWR |  | F1 |-DATA  | I || E ||
    | |STBY|  |_F2_| SENSE-|___||___||
    |_|[__]|_________________________|
    |           ___________________  |
    | [ALPHA]  |                   | |
    | [BETA ]  |                   | |
    | [GAMMA]  |                   | |
    | [DELTA]  |                   | |
    |  _____   |                   | |
    | |^ H B|  |___________________| |
    | || H ||  .-DEVICE INPUT--.  _  |
    | || H ||  |               | [_] |
    | || H ||   GEO   MET   BIO  [_] |
    | |A_H_v|  [___] [___] [___] [_] |
    |________________________________|
    |__[][][][]____________[][][][]__|
    |  ____________________________  |
    | |.-COM XMISSION---.   ______ | |
    | | ________________  E|\ __ /|| |
    | ||ACCEPT|INTERSHIP| M| |  | || |
    | ||------+---------| R| |__| || |
    | ||_POOL_|TRICORDER| G|/____\|| |
    | |____________________________| |
    |  ____________________________  |
    | |.-IMAGE RECORD---..-LIB B--.| |
    | | ________________  ___  ___ | |
    | ||FORWARD |REVERSE|| I || E || |
    | ||--------+-------||___||___|| |
    | ||_INPUT__|_ERASE_|          | |
    | |____________________________| |
    |     ____    ______________     |
     \   |[]ID|  |TRICORDER  VII|   /
      \  |____|  |______________|  /
       `-.______________________.-'
       
       
       
       "


  end
  

  def menu
 
    puts "Would you like to search the database by species name or by individual attributes?" #do I want to have a visual menu here? 
                                                                                             # also include a link to "trivia of the day?"
    puts "Please enter 'name' or 'attribute' to proceed."
    
    user_input gets.strip.downcase
    if user_input == "name" 
      display_list_of_species
      ask_user_for_species_choice # do I need this here at all?
      sleep(2)
    elsif user_input == "attribute"
      display_list_of_attributes
      ask_user_for_attribute_choice  # do I need this here at all?
      sleep(2)
    else
      puts "You have not entered a valid command. Please restate your command."
      menu
      binding.pry 
    end
  end

    def display_list_of_species
      # I need to access my species list
      # print each species out in an alphabetical and readable format (should my readable format be [a-j], [j-m], etc?and then...
      puts "Please select a species from the database or enter 'menu' to return to the main menu"
      species.all.each.with_index(1) do |species, index|# call on the species API
        puts "#{index}. #{species}"
      puts sorted = change.sort { |a, b| a <=> b } # =alphabetical sort
      sleep(2)
      if user_input == "#{species_name}"  # <== might need to change that depending on accessor
        # enter the correct path for individual species information
        display_attributes_by_species
      elsif user_input == "menu"
      menu
      else
        puts "You have not entered a valid command. Please restate your command."
      end

    end

    def display_list_of_attributes
      # I need to access my attributes list
      # print each attribute out in an alphabetical and readable format and then...
      puts "Please select an attribute from the database or enter 'menu' to return to the main menu"
      if user_input == "#{attribute_name}"  # <== might need to change that depending on accessor
        # enter the correct path for species that fall under that attribute
      elsif user_input == "menu"
      menu
      else
        puts "You have not entered a valid command. Please restate your command."
      end
    end

    def display_attributes_by_species
      # i want all the attributes that return "true" on the API to return here as a string in the form of a list
      # BONUS: I want to scrape the MemoryAlpha wiki physiology sections and return that information
    end

    def display_species_by_attribute
      # i want to return every species that lists the selected attribute as "true" on the API
      # BONUS: I want the user to be able to select a species from this list to "learn more about" which returns 
        # display_attributes_by_species with the scraped MemoryAlpha information
    end
  end


end
