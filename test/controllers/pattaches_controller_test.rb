require "test_helper"

class PattachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pattach = pattaches(:one)
  end

  test "should get index" do
    get pattaches_url
    assert_response :success
  end

  test "should get new" do
    get new_pattach_url
    assert_response :success
  end

  test "should create pattach" do
    assert_difference("Pattach.count") do
      post pattaches_url, params: { pattach: { project_id: @pattach.project_id, title: @pattach.title } }
    end

    assert_redirected_to pattach_url(Pattach.last)
  end

  test "should show pattach" do
    get pattach_url(@pattach)
    assert_response :success
  end

  test "should get edit" do
    get edit_pattach_url(@pattach)
    assert_response :success
  end

  test "should update pattach" do
    patch pattach_url(@pattach), params: { pattach: { project_id: @pattach.project_id, title: @pattach.title } }
    assert_redirected_to pattach_url(@pattach)
  end

  test "should destroy pattach" do
    assert_difference("Pattach.count", -1) do
      delete pattach_url(@pattach)
    end

    assert_redirected_to pattaches_url
  end
end
