# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update vote trading_request tradePage]
  before_action :authorize_action, only: %i[show edit update vote home report]

  def show
    @user.Infected! if (Vote.where(vote_reciever_id: @user.id).count) >= 5
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Updated Sucessfully'
    else
      render 'edit'
    end
  end

  # def tradePage
  #   selected_point = params
  #   @sum = selected_point[:water].to_i*14+selected_point[:soup].to_i*12+selected_point[:pouch].to_i*10+selected_point[:Ak47].to_i*8
  #   @sume = selected_point[:watere].to_i*14+selected_point[:soupe].to_i*12+selected_point[:pouche].to_i*10+selected_point[:Ak47e].to_i*8
  # end

  def index
    if !user_signed_in?
      redirect_to new_user_registration_path, alert: 'Please Sign-in'
    elsif current_user.user_type == 'user' && current_user.inventory.nil?
      redirect_to new_inventory_path
    else
      if current_user.user_type == 'admin'
        redirect_to report_users_path
      else
      redirect_to user_path(current_user)
      end
    end
  end

  # def trading_request
  #     Trade.create(sending_user_id: current_user.id , recieving_user_id: @user.id)
  #     redirect_to user_path(@user), notice: 'trade'
  # end


  def vote
    Vote.create(vote_sent_id: current_user.id, vote_reciever_id: @user.id)
    redirect_to user_path(@user), notice: 'Voted'
  end

  def home
    @r = User.ransack(params[:q])
    @all_users = @r.result(distinct: true)
    @admin_user= @all_users.where(user_type: :admin)
    @users = @all_users-@admin_user
  end

  def report
    @all_users= User.all
    @admin_user= User.where(user_type: :admin)
    @users = @all_users-@admin_user
  end


  private

  def user_params
    params.require(:user).permit(:longitude, :latitude, :image)
  end

  # def user
  #   @user ||= User.find(params[:id])
  # end

  def authorize_action
    authorize User
  end

  def set_user
    @user = User.find(params[:id])
  end
end
