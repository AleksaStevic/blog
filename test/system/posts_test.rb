require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:aleksa)
    sign_in @user
  end

  test "should report validation error if form is empty" do
    visit new_post_url
    click_on "Create Post"

    assert_text "Title can't be blank"
    assert_text "Body can't be blank"
  end

  test "should report validation error if title is too short" do
    visit new_post_url
    fill_in "Title", with: "a"
    fill_in "Body", with: "a" * 10
    click_on "Create Post"

    assert_text "Title is too short (minimum is 5 characters)"
  end

  test "should report validation error if body is too short" do
    visit new_post_url
    fill_in "Title", with: "a" * 5
    fill_in "Body", with: "a" * 5
    click_on "Create Post"

    assert_text "Body is too short (minimum is 10 characters)"
  end

  test "should report success if post is created" do
    visit new_post_url
    fill_in "Title", with: "a" * 5
    fill_in "Body", with: "a" * 10
    click_on "Create Post"

    assert_text "Post was successfully created."
  end
end
