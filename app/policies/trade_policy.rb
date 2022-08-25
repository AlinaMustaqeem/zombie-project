# frozen_string_literal: true

class TradePolicy < ApplicationPolicy
  def tradePage?
    @user.user?
  end

  def show?
    @user.user?
  end

  def accept_request?
    @user.user?
  end

  def destroy?
    @user.user?
  end
end
