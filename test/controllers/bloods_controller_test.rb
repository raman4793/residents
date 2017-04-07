require 'test_helper'

class BloodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blood = bloods(:one)
  end

  test "should get index" do
    get bloods_url
    assert_response :success
  end

  test "should get new" do
    get new_blood_url
    assert_response :success
  end

  test "should create blood" do
    assert_difference('Blood.count') do
      post bloods_url, params: { blood: { group: @blood.group } }
    end

    assert_redirected_to blood_url(Blood.last)
  end

  test "should show blood" do
    get blood_url(@blood)
    assert_response :success
  end

  test "should get edit" do
    get edit_blood_url(@blood)
    assert_response :success
  end

  test "should update blood" do
    patch blood_url(@blood), params: { blood: { group: @blood.group } }
    assert_redirected_to blood_url(@blood)
  end

  test "should destroy blood" do
    assert_difference('Blood.count', -1) do
      delete blood_url(@blood)
    end

    assert_redirected_to bloods_url
  end
end
