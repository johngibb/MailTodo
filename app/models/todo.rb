class Todo < ActiveRecord::Base
  belongs_to :todo_list
  
  validates_presence_of :title, :todo_list
end
