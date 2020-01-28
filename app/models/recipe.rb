class Recipe < ApplicationRecord
  belongs_to :user
  
  def ingredients_list
    ingredients.split(", ")
  end

  # def directions_list 
  #   directions.split(", ")
  # end

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

  def friendly_prep_time

    #input: time as integer of minutes, source: reader method of prep_time, example: 125
    #output: return a message in a string, example: "2 hours, 5 minutes"
    hours = prep_time / 60 #to get the hours
    minutes = prep_time % 60 #to get the mninutes 
    time_message = ""

    time_message += "#{hours} #{"Hour".pluralize(hours)}" if hours > 0

    time_message += ", " if hours > 0 && minutes > 0

    time_message += "#{minutes} #{"Minutes".pluralize(minutes)}" if minutes > 0

    time_message

  end

  def chef
    user.name
  end
end
