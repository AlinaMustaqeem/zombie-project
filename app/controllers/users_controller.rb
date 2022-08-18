# frozen_string_literal: true
class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def show
    if (Vote.where(vote_reciever_id: @user.id).count)>=5
      @user.Infected!
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user , notice: "Updated Sucessfully"
    else
      render 'edit'
    end
  end

  def index
    if !user_signed_in?
      redirect_to new_user_registration_path , alert: 'Please Sign-in'
    elsif current_user.inventory.nil?
      redirect_to new_inventory_path
    else
      redirect_to user_path(current_user)
    end
  end

  def vote
    @user = User.find(params[:id])
    Vote.create(vote_sent_id: current_user.id , vote_reciever_id: @user.id)

    redirect_to user_path(@user), notice: "Voted"
  end

  def home
    @q = User.ransack(params[:q])
    @users=@q.result(distinct: true)
  end

private
  def user_params
    params.require(:user).permit(:longitude, :latitude, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
