class InventoryPolicy < ApplicationPolicy
  def index?
    @user.user?
  end

  def new?
    @user.user?
  end

  def create?
    @user.user?
  end

  def destroy?
    @user.user?
  end
end
