class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todos
  
  validates_presence_of :user
end
