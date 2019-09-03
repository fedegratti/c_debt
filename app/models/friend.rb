class Friend < User
    def self.candidate_friends(user)
        candidate_users = (User.current_users.pluck(:id) - user.friends.pluck(:id)).reject{ |id| id == user.id }
        Friend.select { |friend| candidate_users.include?(friend.id) }
    end
end
