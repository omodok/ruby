require 'test_helper'

class MeibosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meibo = meibos(:one)
  end

  test "should get index" do
    get meibos_url
    assert_response :success
  end

  test "should get new" do
    get new_meibo_url
    assert_response :success
  end

  test "should create meibo" do
    assert_difference('Meibo.count') do
      post meibos_url, params: { meibo: { denwa: @meibo.denwa, jusyo: @meibo.jusyo, shimei: @meibo.shimei } }
    end

    assert_redirected_to meibo_url(Meibo.last)
  end

  test "should show meibo" do
    get meibo_url(@meibo)
    assert_response :success
  end

  test "should get edit" do
    get edit_meibo_url(@meibo)
    assert_response :success
  end

  test "should update meibo" do
    patch meibo_url(@meibo), params: { meibo: { denwa: @meibo.denwa, jusyo: @meibo.jusyo, shimei: @meibo.shimei } }
    assert_redirected_to meibo_url(@meibo)
  end

  test "should destroy meibo" do
    assert_difference('Meibo.count', -1) do
      delete meibo_url(@meibo)
    end

    assert_redirected_to meibos_url
  end
end
