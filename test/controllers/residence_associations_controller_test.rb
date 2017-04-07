require 'test_helper'

class ResidenceAssociationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @residence_association = residence_associations(:one)
  end

  test "should get index" do
    get residence_associations_url
    assert_response :success
  end

  test "should get new" do
    get new_residence_association_url
    assert_response :success
  end

  test "should create residence_association" do
    assert_difference('ResidenceAssociation.count') do
      post residence_associations_url, params: { residence_association: { association_admin_references: @residence_association.association_admin_references, lat: @residence_association.lat, lng: @residence_association.lng, name: @residence_association.name } }
    end

    assert_redirected_to residence_association_url(ResidenceAssociation.last)
  end

  test "should show residence_association" do
    get residence_association_url(@residence_association)
    assert_response :success
  end

  test "should get edit" do
    get edit_residence_association_url(@residence_association)
    assert_response :success
  end

  test "should update residence_association" do
    patch residence_association_url(@residence_association), params: { residence_association: { association_admin_references: @residence_association.association_admin_references, lat: @residence_association.lat, lng: @residence_association.lng, name: @residence_association.name } }
    assert_redirected_to residence_association_url(@residence_association)
  end

  test "should destroy residence_association" do
    assert_difference('ResidenceAssociation.count', -1) do
      delete residence_association_url(@residence_association)
    end

    assert_redirected_to residence_associations_url
  end
end
