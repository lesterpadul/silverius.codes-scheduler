require "application_system_test_case"

class MessageGroupsTest < ApplicationSystemTestCase
  setup do
    @message_group = message_groups(:one)
  end

  test "visiting the index" do
    visit message_groups_url
    assert_selector "h1", text: "Message Groups"
  end

  test "creating a Message group" do
    visit message_groups_url
    click_on "New Message Group"

    fill_in "Content", with: @message_group.content
    fill_in "Message code", with: @message_group.message_code
    fill_in "Status", with: @message_group.status
    fill_in "User", with: @message_group.user_id
    click_on "Create Message group"

    assert_text "Message group was successfully created"
    click_on "Back"
  end

  test "updating a Message group" do
    visit message_groups_url
    click_on "Edit", match: :first

    fill_in "Content", with: @message_group.content
    fill_in "Message code", with: @message_group.message_code
    fill_in "Status", with: @message_group.status
    fill_in "User", with: @message_group.user_id
    click_on "Update Message group"

    assert_text "Message group was successfully updated"
    click_on "Back"
  end

  test "destroying a Message group" do
    visit message_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message group was successfully destroyed"
  end
end
