require 'test_helper'

class UserTest < ActiveSupport::TestCase

def setup
  @user = User.new(name: "Ryan Kendall", email: "ryan@gmail.com",
                   password: "12345", password_confirmation: "12345")
end

test "should be valid" do
  assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?

  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "name should not be long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end
    test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 8
    assert_not @user.valid?
  end

end
