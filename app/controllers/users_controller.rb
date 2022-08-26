# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :authorize_action, only: %i[show edit update home report requests]

  def show
    @user.Infected! if Vote.votes_count(@user) >= 5
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Updated Sucessfully'
    else
      render 'edit' , notice: 'can not be Updated'
    end
  end

  def requests; end

  def index
    if !user_signed_in?
      redirect_to new_user_registration_path, alert: 'Please Sign-in'
    elsif current_user.user_type == 'user' && current_user.inventory.nil?
      redirect_to new_inventory_path , notice: 'Register Your Inventory'
    elsif current_user.user_type == 'admin'
      redirect_to report_users_path, notice: 'Admin Pannel'
    else
      redirect_to user_path(current_user), notice: 'Welcome to App'
    end
  end

  def home
    @r = User.ransack(params[:q])
    @users = @r.result.where(user_type: :user)
  end

  def report
    @users = User.where(user_type: :user)
  end

  private

  def user_params
    params.require(:user).permit(:longitude, :latitude, :image)
  end

  def authorize_action
    authorize User
  end

  def set_user
    @user = User.find(params[:id])
  end
end
