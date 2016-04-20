require './options.rb'
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

  def self.delete_name
    Voter.show
    puts "Who would you like to delete?"
    voter_to_be_deleted = gets.chomp.split(" ").map(&:capitalize).join(" ")
    @@everyone.each do |people|
      p people
      Voter.delete_if {|people| people == voter_to_be_deleted}
      end
    Voter.show
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

when 'D'
  Voter.delete_name

when 'Q'
  break
end
end
