# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    if !user_signed_in?
      redirect_to new_user_registration_path
    elsif current_user.inventory.nil?
      redirect_to new_inventory_path
    else
      redirect_to user_path(current_user)
    end
  end

  def home
    @users = User.all
  end
end
