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
    puts "\nPlease enter a letter to display a list of corresponding species whose name begins with that letter."
    user_input = gets.strip.downcase
    arr = API.searchSpecies(user_input)
    arr.each_with_index { |x, idx| puts "#{idx + 1}. #{x.name}"}
    self.ask_user_for_species_input(arr)
  end

  def ask_user_for_species_input(list_by_letter)
    puts "\nPlease select an index number from the list to learn more about the species."
    index = gets.strip.to_i - 1
    species_data = list_by_letter[index].name
  end

end
