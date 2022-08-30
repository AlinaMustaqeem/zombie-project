# frozen_string_literal: true

class TradePolicy < ApplicationPolicy
  attr_reader :user, :trade

  def initialize(user, trade)
    @user = user
    @trade = trade
  end

  def new?
    (@user.user? && @trade.recieving_user_id != @user.id && @user.Not_Infected?)
  end

  def create?
    (@user.user? && @trade.recieving_user_id != @trade.sending_user_id && @user.Not_Infected?)
  end

  def accept_request?
    (@user.user? && @trade.recieving_user_id != @trade.sending_user_id && @user.Not_Infected?)
  end

  def destroy?
    (@user.user? && @trade.recieving_user_id != @trade.sending_user_id && @user.Not_Infected?)
  end

end
