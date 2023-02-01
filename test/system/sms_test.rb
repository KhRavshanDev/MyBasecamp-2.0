require "application_system_test_case"

class SmsTest < ApplicationSystemTestCase
  setup do
    @sm = sms(:one)
  end

  test "visiting the index" do
    visit sms_url
    assert_selector "h1", text: "Sms"
  end

  test "should create sm" do
    visit sms_url
    click_on "New sm"

    fill_in "Msg", with: @sm.msg_id
    fill_in "Title", with: @sm.title
    click_on "Create Sm"

    assert_text "Sm was successfully created"
    click_on "Back"
  end

  test "should update Sm" do
    visit sm_url(@sm)
    click_on "Edit this sm", match: :first

    fill_in "Msg", with: @sm.msg_id
    fill_in "Title", with: @sm.title
    click_on "Update Sm"

    assert_text "Sm was successfully updated"
    click_on "Back"
  end

  test "should destroy Sm" do
    visit sm_url(@sm)
    click_on "Destroy this sm", match: :first

    assert_text "Sm was successfully destroyed"
  end
end
