require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:three)
  end

  test "makes sure three user is deleted" do
    assert @user.is_deleted?
  end

  test "makes sure inactive message is working for deleted users" do
    assert_equal @user.inactive_message, :deleted_account
  end

  test "makes suer new with session is working" do
    data = {}
    data["email"] = "facebook@test.com"

    facebook_session = {"devise.facebook_data"=>{"extra"=>{"raw_info"=>"something"}}}
    @user = User.new_with_session(data,facebook_session)
    assert_equal @user.email,"facebook@test.com"

    data["email"] = "twitter@test.com"
    twitter_session = {"devise.twitter_data"=>{"extra"=>{"raw_info"=>"something"}}}
    @user = User.new_with_session(data,twitter_session)
    assert_equal @user.email,"twitter@test.com"


  end

end
