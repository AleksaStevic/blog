require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:aleksa)
    @post = posts(:post1)
  end

  test "should not save comment without body" do
    comment = Comment.new user: @user, post: @post
    assert_not comment.save, "Saved the comment without a body"
  end

  test "should not save comment without post" do
    comment = Comment.new body: "This is a body", user: @user
    assert_not comment.save, "Saved the comment without a post"
  end

  test "should save comment with all attributes" do
    comment = Comment.new body: "This is a body", user: @user, post: @post
    assert comment.save, "Could not save the comment with a body, user and post"
  end
end
