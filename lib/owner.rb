class Owner
  attr_accessor :pets, :cat
  attr_reader :name, :species
  @@all = []
  @cats = []
  @dogs = []
  def initialize(name)
    @name = name
    @species = ("human")
    @@all << self
    @pets = cats = [], dogs = []
  end
  def say_species
     "I am a human."
  end
  def self.all
    @@all
  end
  def self.count
    self.all.count
  end
  def self.reset_all
    self.all.clear
  end
  def cats
    Cat.all.select {|cat| cat.owner == self }
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end
  def buy_cat(name)
    Cat.new(name, self)
  end
  def buy_dog(name)
    Dog.new(name, self)
  end
  def walk_dogs
    walk = self.dogs
    walk.each {|dog| dog.mood = "happy" }
  end
  def feed_cats
    feed = self.cats
    feed.each {|cat| cat.mood = "happy"}
  end
  def sell_pets
    selld = self.dogs
    sellc = self.cats
    sellc.each {|cat| cat.mood = "nervous"}
    selld.each {|dog| dog.mood = "nervous"}
    sellc.each {|cat| cat.owner = nil}
    selld.each {|dog| dog.owner = nil}
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end