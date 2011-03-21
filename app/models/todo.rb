class Todo < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :description, :user
end
