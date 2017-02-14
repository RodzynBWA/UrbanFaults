require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "create new user" do
    user = User.new(email: 'test@test.test', first_name: 'Test', last_name: 'Test', password: 'Test', city: c1)
    assert user.valid?
  end
end
