# frozen_string_literal: true

class TradesController < ApplicationController
  before_action :set_user, only: %i[show accept_request destroy]
  before_action :set_trade, only: %i[accept_request destroy]
  before_action :authorize_action, only: %i[accept_request index show destroy]

  def new
    @user = User.find(params[:user])
    @trade = Trade.new
  end

  def create
    @user = User.find(params[:trade][:user])
    if TradeService.new(trade_params).equal_points
      Trade.create!(trade_params.merge(sending_user_id: current_user.id, recieving_user_id: @user.id,
                                       request_status: :pending))
      flash[:success] = 'Trade Created successfully'
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Points Are not equal yet.. Can not Trade'
      render 'new'
    end
  end

  def accept_request
    AcceptInventory.new(@user.id, current_user.id, @trade).updating
    @trade.accepted!
    redirect_to user_path(current_user.id), notice: 'Your Trade has been Done'
  end


  def show; end

  def destroy
    @trade.rejected!
    redirect_to user_path(current_user), notice: 'Rejected Request'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_trade
    @trade = Trade.find_by(sending_user_id: @user.id, recieving_user_id: current_user.id)
  end

  def trade_params
    params.require(:trade).permit(:waterc, :watere, :soupc, :soupe, :pouchc, :pouche, :ak47e, :ak47c)
  end

  def authorize_action
    authorize Trade
  end
end
