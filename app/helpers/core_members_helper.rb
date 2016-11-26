module CoreMembersHelper
  def reset_is_core_member
    users = User.all
    for user in users
      user.update_attributes({is_core_member: false})
    end
  end

  def set_is_core_member(user_ids)
    for user_id in user_ids
      user = User.find(user_id)
      user.update_attributes({is_core_member: true})
    end
  end
end
