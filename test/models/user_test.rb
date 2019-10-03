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

end
