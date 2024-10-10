require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:aleksa)
  end

  test "should not save post without title" do
    post = Post.new body: "This is a body", user: @user
    assert_not post.save, "Saved the post without a title"
  end

  test "should not save post without body" do
    post = Post.new title: "This is a title", user: @user
    assert_not post.save, "Saved the post without a body"
  end

  test "should not save post without user" do
    post = Post.new title: "This is a title", body: "This is a body"
    assert_not post.save, "Saved the post without a user"
  end

  test "should save post with all attributes" do
    post = Post.new title: "This is a title", body: "This is a body", user: @user
    assert post.save, "Could not save the post with a title and body"
  end
end
