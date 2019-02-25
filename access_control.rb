class Region
  attr_accessor :name

  def initialize(name, population, area_size, continent)
    self.name = name
    self.population = population
    self.area_size = area_size
    self.continent = continent
  end

  def greeting
    puts name_info + population_info
  end

  def more_densely_populated?(other_region)
    result = population_density > other_region.population_density ? 'more' : 'less'
    puts "#{name} is #{result} densely populated than #{other_region.name}."
  end

  def the_same_continent?(other_region)
    if continent.eql?(other_region.continent)
      puts "#{name} and #{other_region.name} lie in the same continent."
    else
      puts "#{name} and #{other_region.name} lie in the different continents."
    end
  end

  def can_be_crowdy?
    if self.consider_as_densely_populated?
      puts "#{name} can be crowdy."
    else
      "There is enough space in the #{name}."
    end
  end

  protected

  attr_accessor :continent

  def name_info
    "Hello, I'm #{name}!"
  end

  private

  attr_accessor :population, :area_size

  def population_info
    " #{population} people live here."
  end

  def population_density
    population / area_size
  end

  def consider_as_densely_populated?
    population_density > self.class::HIGH_POPULATION_DENSITY
  end
end

class Country < Region
  HIGH_POPULATION_DENSITY = 300

  def own_greeting
    puts "The country name: #{name}." + population_info
  end
end

class City < Region
  HIGH_POPULATION_DENSITY = 3000

  def own_greeting
    puts name_info + " The population: #{population} people."
  end
end

# initialization
wroclaw = City.new('Wrocław', 638_000, 293, 'Europe')
san_francisco = City.new('San Francisco', 884_000, 121, 'Northern America')
poland = Country.new('Poland', 38_000_000, 312_000, 'Europe')

# I section
wroclaw.greeting
poland.greeting

# II section
wroclaw.name_info
wroclaw.population_info

# III section
wroclaw.own_greeting
poland.own_greeting

# IV section
wroclaw.more_densely_populated?(san_francisco)
wroclaw.the_same_continent?(san_francisco)
san_francisco.can_be_crowdy?
