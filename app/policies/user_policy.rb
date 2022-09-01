# frozen_string_literal: true

class UserPolicy < ApplicationPolicy

  attr_reader :current_user, :model

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def report?
    @current_user.admin?
  end

  def show?
    @current_user.user?
  end

  def edit?
    @user.user? && @current_user == @user
  end

  def update?
    @user.user? && @current_user == @user
  end


end
