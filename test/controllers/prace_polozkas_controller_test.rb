require 'test_helper'

class PracePolozkasControllerTest < ActionController::TestCase
  setup do
    @prace_polozka = prace_polozkas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prace_polozkas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prace_polozka" do
    assert_difference('PracePolozka.count') do
      post :create, prace_polozka: { datum: @prace_polozka.datum, hodiny: @prace_polozka.hodiny, obsah: @prace_polozka.obsah, osoba_id: @prace_polozka.osoba_id, projekt_id: @prace_polozka.projekt_id }
    end

    assert_redirected_to prace_polozka_path(assigns(:prace_polozka))
  end

  test "should show prace_polozka" do
    get :show, id: @prace_polozka
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prace_polozka
    assert_response :success
  end

  test "should update prace_polozka" do
    patch :update, id: @prace_polozka, prace_polozka: { datum: @prace_polozka.datum, hodiny: @prace_polozka.hodiny, obsah: @prace_polozka.obsah, osoba_id: @prace_polozka.osoba_id, projekt_id: @prace_polozka.projekt_id }
    assert_redirected_to prace_polozka_path(assigns(:prace_polozka))
  end

  test "should destroy prace_polozka" do
    assert_difference('PracePolozka.count', -1) do
      delete :destroy, id: @prace_polozka
    end

    assert_redirected_to prace_polozkas_path
  end
end
