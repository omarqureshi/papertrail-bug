require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "when modifying a user should not have an exception" do
    user = FactoryGirl.create(:user)
    user.name = "Something else"
    assert user.save
  end
end
