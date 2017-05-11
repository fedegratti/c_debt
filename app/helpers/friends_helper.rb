module FriendsHelper
  def add_friend_path friend
    "/users/#{@user.id}/friends/add/#{friend.id}"
  end
end
