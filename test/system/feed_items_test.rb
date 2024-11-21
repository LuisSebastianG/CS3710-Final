require "application_system_test_case"

class FeedItemsTest < ApplicationSystemTestCase
  setup do
    @feed_item = feed_items(:one)
  end

  test "visiting the index" do
    visit feed_items_url
    assert_selector "h1", text: "Feed items"
  end

  test "should create feed item" do
    visit feed_items_url
    click_on "New feed item"

    fill_in "Body", with: @feed_item.body
    fill_in "Likes", with: @feed_item.likes
    fill_in "User", with: @feed_item.user_id
    click_on "Create Feed item"

    assert_text "Feed item was successfully created"
    click_on "Back"
  end

  test "should update Feed item" do
    visit feed_item_url(@feed_item)
    click_on "Edit this feed item", match: :first

    fill_in "Body", with: @feed_item.body
    fill_in "Likes", with: @feed_item.likes
    fill_in "User", with: @feed_item.user_id
    click_on "Update Feed item"

    assert_text "Feed item was successfully updated"
    click_on "Back"
  end

  test "should destroy Feed item" do
    visit feed_item_url(@feed_item)
    click_on "Destroy this feed item", match: :first

    assert_text "Feed item was successfully destroyed"
  end
end
