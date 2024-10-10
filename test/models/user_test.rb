require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new email: "aleksa3@fcc.com", password: "secret123"
    assert_not user.save, "Saved the user without a name"
  end

  test "should not save user without email" do
    user = User.new username: "aleksa4", password: "secret123"
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without password" do
    user = User.new username: "aleksa5", email: "aleksa5@fcc.com"
    assert_not user.save, "Saved the user without a password"
  end
end
