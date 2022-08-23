# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def report?
    @user.admin?
  end

  def show?
    @user.user?
  end

  def edit?
    @user.user?
  end

  def update?
    @user.user?
  end

  def vote?
    @user.user?
  end

  def home?
    @user.user?
  end
end
