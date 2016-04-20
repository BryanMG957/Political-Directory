# require './directory1.rb'
module Options


def self.menu
  puts "Welcome to Political Directory"
  puts "Press 'Enter' to continue"
  pointless_space = gets.chomp
end

def self.initial_questions
  puts "What would you like to do?"
  puts "(C)reate."
  puts "(L)ist."
  puts "(U)pdate."
  puts "(D)elete."
  puts "(Q)uit"
end

def self.create
  puts "What would you like to create?"
  puts "(P)olitician or (V)oter?"
  type = gets.chomp.upcase
  if type == "P"
    puts "Name:"
    politician_name = gets.chomp.split(" ").map(&:capitalize).join(" ")
    puts "Party?"
    puts "(D)emocrat or (R)epublican?"
    political_party = gets.chomp.capitalize
      if political_party == "D"
        political_party = "Democrat"
      elsif political_party == "R"
        political_party = "Republican"
      else
        Options.create
      end
    Politician.new(politician_name, political_party)
    puts "Politician #{politician_name}, has been registered as a #{political_party}"
    puts " "

  elsif type == "V"
    puts "Name:"
    voter_name = gets.chomp.split(" ").map(&:capitalize).join(" ")
    puts "Political Affliliation?"
    puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral?"
    political_affliliation = gets.chomp.capitalize
      if political_affliliation == "L"
        political_affliliation = "Liberal"
      elsif political_affliliation == "C"
        political_affliliation = "Conservative"
      elsif political_affliliation == "T"
        political_affliliation = "Tea Party"
      elsif political_affliliation == "S"
        political_affliliation = "Socialist"
      elsif political_affliliation == "N"
        political_affliliation = "Neutral"
      else
        Options.create
      end
      Voter.new(voter_name, political_affliliation)
      puts "Voter #{voter_name}, has been registered as a #{political_affliliation}"
    else
      Options.create
    end
end

  # def self.delete_name
  #   Voter.show
  #   puts "Who would you like to delete?"
  #   voter_to_be_deleted = gets.chomp.split(" ").map(&:capitalize).join(" ")
  #   @@everyone.each do |people|
  #       if
  #         people.name == voter_to_be_deleted
  #         people.delete
  #       else
  #         puts "Wrong name, try again"
  #         puts " "
  #         Options.delete_name
  #       end
  #     end
  #   Voter.show
  # end




end

# def update
#   puts "What movie do you want to update?"
#     title = gets.chomp
#     if movies[title.to_sym].nil?
#       puts "Movie not found!"
#     else
#       puts "What's the new rating? (Type a number 0 to 4.)"
#       rating = gets.chomp
#       movies[title.to_sym] = rating.to_i
#       puts "#{title} has been updated with new rating of #{rating}."
#     end
# end
#
# def delete
#   puts "What person do you want to delete?"
#     title = gets.chomp
#     if movies[title.to_sym].nil?
#       puts "Movie not found!"
#     else
#       movies.delete(title.to_sym)
#       puts "#{title} has been removed."
#     end
# end
