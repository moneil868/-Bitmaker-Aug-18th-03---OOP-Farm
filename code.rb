require 'pry'

class Farm

  @@harvest = 0
  @@fields = []

  def initialize(name)
    @name = name
    @harvest = @@harvest
    @fields = @@fields
  end

  def self.all
    puts @@fields.inspect
  end

  def self.relax
    if @@fields.length == 0
      puts "You currently have no fields, get to work you lazy bum!"
    else
        @@fields.sample do |field|
          puts "#{ field.size / 2 } hectares of tall green stalks rustling in the breeze fill your horizon. The sun hangs low, casting an orange glow on a sea of #{ field.size } hectares of #{ field.name }."
        end
    end
  end

  def self.harvest
    @@fields.each do |field|
      total = field.harvest
      @@harvest += total
    end
    puts "The farm has #{@@harvest} harvested food so far."
  end

  def self.choose(option)
    unless option == "exit"
      self.options(option)
    end
  end

  def self.options(option)
      if option.downcase == "field"
        Farm.field
      elsif option.downcase == "status"
        Farm.status
      elsif option.downcase == "harvest"
        Farm.harvest
      elsif option.downcase == "all"
        Farm.all
      elsif option.downcase == "relax"
        Farm.relax
      else
        puts "I'm sorry, that option is not valid"
      end
      puts
      puts "------------------------------"
      puts "Select another option"
      puts "------------------------------"
      puts "Options: "
      puts "field -> adds a new field"
      puts "harvest -> harvests crops and adds to total harvested"
      puts "status -> displays some information about the farm"
      puts "relax -> provides lovely descriptions of your fields"
      puts "exit -> exits the program"
      puts "------------------------------"
      print "Option:  "
      option = gets.chomp
      self.choose(option)
      puts
  end

  def self.field
    print "What kind of field is it: (corn or wheat?) "
    name = gets.chomp
    print "How large is the field in hectares?: "
    size = gets.chomp.to_i
    self.add_fields(name, size)
    puts
  end

  def self.add_fields(name, size)
    new_field = Field.new(name, size)
    @@fields << new_field
    puts "Added a #{name} field of #{size} hectares!"
  end

  def self.fields
    @@fields.each do |field|
      puts "#{field.name} field is #{field.size} hectares."
    end
  end

  def self.status
    self.fields
    puts "The farm has #{@@harvest} harvested food so far."
  end

  def self.exits
    exit
  end

end




class Field

  WHEAT_FOOD = 30
  CORN_FOOD = 20

  def initialize(name, size)
    @name = name
    @size = size
    @food_per_hectare = 0

    if @name.downcase == "wheat"
      @food_per_hectare = WHEAT_FOOD
    else
      @food_per_hectare = CORN_FOOD
    end

    @harvest = @size * @food_per_hectare

  end

  def name
    @name
  end

  def size
    @size
  end

  def food_per_hectare
    @food_per_hectare
  end

  def harvest
    @harvest.to_i
  end

end

my_farm = Farm.new("Marlon's Farm")

puts "Welcome to the farming application, Select an option"
puts "------------------------------"
puts "Options: "
puts "field -> adds a new field"
puts "harvest -> harvests crops and adds to total harvested"
puts "status -> displays some information about the farm"
puts "relax -> provides lovely descriptions of your fields"
puts "exit -> exits the program"
puts "------------------------------"
print "Option:  "
option = gets.chomp
Farm.choose(option)
puts
