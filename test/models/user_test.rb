require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "makes sure three user is deleted" do
    @user = users(:three)
    assert @user.is_deleted?
  end

end
