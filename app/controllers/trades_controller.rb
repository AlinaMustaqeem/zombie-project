# frozen_string_literal: true

class TradesController < ApplicationController
  before_action :set_user, only: %i[tradePage accept_request destroy]
  before_action :set_trade, only: %i[accept_request destroy]

  def new; end

  def tradePage
    if TradeService.new(params).equal_points
      Trade.create!(trade_params.merge(sending_user_id: current_user.id, recieving_user_id: @user.id,
                                       request_status: :pending))
      flash[:success] = 'Trade Created successfully'
    else
      flash[:success] = 'Points Are not equal yet.. Can not Trade'
    end
  end

  def accept_request
    AcceptInventory.new(@user.id, current_user.id, @trade).updating
    redirect_to user_path(current_user.id), notice: 'Your Trade has been Done'
    @trade.destroy
  end

  def index; end

  def destroy
    @trade.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_trade
    @trade = Trade.find_by(sending_user_id: @user.id, recieving_user_id: current_user.id)
  end

  def trade_params
    params.permit(:sending_user_id, :recieving_user_id, :waterc, :watere, :soupc, :soupe, :pouchc, :pouche, :ak47e,
                  :ak47c)
  end
end
