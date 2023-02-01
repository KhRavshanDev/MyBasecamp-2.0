require "application_system_test_case"

class MsgsTest < ApplicationSystemTestCase
  setup do
    @msg = msgs(:one)
  end

  test "visiting the index" do
    visit msgs_url
    assert_selector "h1", text: "Msgs"
  end

  test "should create msg" do
    visit msgs_url
    click_on "New msg"

    fill_in "Body", with: @msg.body
    fill_in "Project", with: @msg.project_id
    fill_in "Title", with: @msg.title
    click_on "Create Msg"

    assert_text "Msg was successfully created"
    click_on "Back"
  end

  test "should update Msg" do
    visit msg_url(@msg)
    click_on "Edit this msg", match: :first

    fill_in "Body", with: @msg.body
    fill_in "Project", with: @msg.project_id
    fill_in "Title", with: @msg.title
    click_on "Update Msg"

    assert_text "Msg was successfully updated"
    click_on "Back"
  end

  test "should destroy Msg" do
    visit msg_url(@msg)
    click_on "Destroy this msg", match: :first

    assert_text "Msg was successfully destroyed"
  end
end
