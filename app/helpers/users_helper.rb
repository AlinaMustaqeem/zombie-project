# frozen_string_literal: true

module UsersHelper

  def vote_count(user)
    Vote.where(vote_reciever_id: user.id).count
  end

  def not_effected?(user)
    ((current_user != user)  && user.status==Not_Infected )
  end

  def not_voted?(user)
    !(current_user.vote_reciever.ids.include? user.id)
  end


end
