# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :authorize_action, only: %i[show edit update requests]

  def show
    @user.Infected! if Vote.votes_count(@user) >= 5
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Updated Sucessfully'
    else
      render 'edit', notice: 'can not be Updated'
    end
  end


  def index
    if current_user.admin?
      redirect_to report_users_path, notice: 'Admin Pannel'
    elsif current_user.user? && current_user.inventory.nil?
      redirect_to new_inventory_path, notice: 'Register Your Inventory'
    else
      @r = User.ransack(params[:q])
      @users = @r.result.where(user_type: :user)
    end
  end

  def report
    @users = User.where(user_type: :user)
    authorize @users
  end

  private

  def user_params
    params.require(:user).permit(:longitude, :latitude, :image)
  end

  def authorize_action
    authorize @user
  end

  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to users_path, alert: 'Record Not Found'
    rescue Exception
      flash[:alert]= "Something is Missing"
    end

  end
end
