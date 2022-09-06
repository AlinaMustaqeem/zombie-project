# frozen_string_literal: true

class InventoryPolicy < ApplicationPolicy
  def initialize(current_user, inventory)
    @current_user = current_user
    @inventory = inventory
  end

  def new?
    @current_user.user?
  end

  def create?
    @current_user.user?
  end


end
