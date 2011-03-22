class Todo < ActiveRecord::Base
  belongs_to :todo_list
  
  validates_presence_of :title, :description, :todo_list
end
