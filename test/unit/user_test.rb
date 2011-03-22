require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "clean email fullname" do
    assert_equal "john@gmail.com", User.clean_email("John Doe <john@gmail.com>")
  end
  
  test "clean email" do
    assert_equal "john@gmail.com", User.clean_email("john@gmail.com")
  end
end
