class Actor < ActiveRecord::Base
  has_many :characters

  def full_name
    "#{self.first_name} #{self.last_name}" 
  end

  def list_roles
    characters = Character.where("actor_id == id")
    shows = []
    characters.each do |char|
      shows << Show.find_by_id(char.id)
    end
    sentence = ""
    characters.each do |info|
      shows.each do |show|
       sentence += "#{info.name} - #{show.name}"
      end 
    end
    sentence
  end
  
end