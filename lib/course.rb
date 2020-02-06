class Course
  attr_accessor :title, :schedule, :description
  @@all = []
  
  def initialize
    save
  end
  
  def self.all
    @@all
  end
  
  def self.reset_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
end

