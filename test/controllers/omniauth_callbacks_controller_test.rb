require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase

  setup do
    request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => '123545',
      'info' => { name: 'Fede', email: 'facebook@test.com' }
    })
  end

  test "makes sure an user is created from facebook" do
    OmniAuth.config.test_mode = true

    assert_raises(Module::DelegationError) do
      @controller.facebook
    end

    assert_equal User.last.email, "facebook@test.com"
  end

  test "makes sure an user with missing data is not created from facebook" do
    request.env["omniauth.auth"] = OmniAuth.config.add_mock(:facebook, {:uid => '12345'})
    assert_raises(Module::DelegationError) do
      @controller.facebook
    end

    assert_not_equal User.last.email, "facebook@test.com"
  end
end
