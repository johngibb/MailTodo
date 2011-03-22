class User < ActiveRecord::Base
  has_many :todos
  
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.clean_email(email)
    email = $1 if email =~ /^.*?\<(.*)\>/
    email
  end
end
