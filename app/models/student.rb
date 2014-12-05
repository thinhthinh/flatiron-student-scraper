class Student < ActiveRecord::Base

  def stringify_name
    self.name.downcase.gsub(" ", "-")
  end

end
