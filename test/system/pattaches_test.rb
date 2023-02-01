require "application_system_test_case"

class PattachesTest < ApplicationSystemTestCase
  setup do
    @pattach = pattaches(:one)
  end

  test "visiting the index" do
    visit pattaches_url
    assert_selector "h1", text: "Pattaches"
  end

  test "should create pattach" do
    visit pattaches_url
    click_on "New pattach"

    fill_in "Project", with: @pattach.project_id
    fill_in "Title", with: @pattach.title
    click_on "Create Pattach"

    assert_text "Pattach was successfully created"
    click_on "Back"
  end

  test "should update Pattach" do
    visit pattach_url(@pattach)
    click_on "Edit this pattach", match: :first

    fill_in "Project", with: @pattach.project_id
    fill_in "Title", with: @pattach.title
    click_on "Update Pattach"

    assert_text "Pattach was successfully updated"
    click_on "Back"
  end

  test "should destroy Pattach" do
    visit pattach_url(@pattach)
    click_on "Destroy this pattach", match: :first

    assert_text "Pattach was successfully destroyed"
  end
end
