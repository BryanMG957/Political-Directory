require './options.rb'
include Options
#To begin, I want this Ruby file to require the methods in module Options
class Voter
  attr_accessor :name
  attr_accessor :political_aff

  @@everyone = []

  def initialize(name, political_aff)
    @name = name
    @political_aff = political_aff
    @@everyone << self
  end

  def self.show
    @@everyone.each do |people|
      if people.class == Voter
        puts "* Voter, #{people.name}, #{people.political_aff}"
      elsif people.class == Politician
        puts "* Politician, #{people.name}, #{people.party}"
      end
    end
    puts " "
  end

  def self.delete
    Voter.show
    puts "Who would you like to delete?"
    voter_to_be_deleted = gets.chomp.split(" ").map(&:capitalize).join(" ")
    @@everyone.each do |people|
      if people.name == voter_to_be_deleted
        @@everyone.delete(people)
      end
      end
    Voter.show
    puts "#{voter_to_be_deleted}, has been deleted!"
  end

  def self.update
    Voter.show
    puts "Who would you like to update?"
    voter_to_be_updated = gets.chomp.split(" ").map(&:capitalize).join(" ")
    @@everyone.each do |people|
      if people.name == voter_to_be_updated
        puts "New name?"
        puts "(Y)es"
        puts "(N)o"
        y_n = gets.chomp.upcase
        case y_n
        when 'Y'
          puts "What is the new name?"
          new_name = gets.chomp.split(" ").map(&:capitalize).join(" ")
          people.name = new_name
        when 'N'
          if people.class == Voter
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
                Voter.update
              end
            people.political_aff = political_affliliation
          elsif people.class == Politician
            puts "Party?"
            puts "(D)emocrat or (R)epublican?"
            political_party = gets.chomp.capitalize
              if political_party == "D"
                political_party = "Democrat"
              elsif political_party == "R"
                political_party = "Republican"
              else
                Voter.update
              end
            people.party = political_party
          end
        else
          Voter.update
        end
      end
      end
    Voter.show
    puts "Directory has been updated!"
  end

end

class Politician < Voter
  attr_accessor :party

  def initialize (name, party)
    @name = name
    @party = party
    @@everyone << self
  end

end

Politician.new("Donald 'Drumf' Trump", "Republican")
Politician.new("Ted 'Canada eh' Cruz", "Republican")
Politician.new("John 'Who?' Kasich", "Republican")
Politician.new("Bernie 'feel the BURN' Sanders", "Democrat")
Politician.new("Hilary 'Monica's B' Clinton", "Democrat")

Voter.new("Bonnie Nelson", "Liberal")
Voter.new("Debra Green", "Conservative")
Voter.new("Richard Martinez", "Tea Party")
Voter.new("Alice Taylor", "Socialist")
Voter.new("Sara Davis", "Neutral")
Voter.new("Ronald Thompson", "Liberal")
Voter.new("Terry Gray", "Conservative")
Voter.new("Karen Baker", "Tea Party")
Voter.new("Doris Parker", "Socialist")
Voter.new("Mildred Jenkins", "Neutral")

Options.menu
while true
Options.initial_questions
initial_option = gets.chomp.capitalize
#This is the main choice when dealing with the directory
case initial_option
when 'C'
  Options.create
when 'L'
  Voter.show
when 'U'
  Voter.update
when 'D'
  Voter.delete
when 'Q'
  break
end
end
