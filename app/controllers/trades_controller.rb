# frozen_string_literal: true
class TradesController < ApplicationController
  before_action :set_user, only: %i[tradePage accept_request destroy ]
  before_action :set_trade, only: %i[accept_request destroy]

  def new; end

  def tradePage

    if (TradeService.new(params)).equal_points
      Trade.create!(trade_params.merge(sending_user_id: current_user.id, recieving_user_id: @user.id,request_status: :pending))
      flash[:success] = 'Trade Created successfully'
    else
      flash[:success] = 'Trade Can not be done'
    end

  end

  def accept_request
    @inventory = Inventory.find_by(user_id: @user.id)
    @inventory2 = Inventory.find_by(user_id: current_user.id)
    @inventory.update(water: (@inventory.water + (@trade.waterc.to_i * 14)),
                      soup: (@inventory.soup + (@trade.soupc.to_i * 12)), pouch: (@inventory.pouch + (@trade.pouchc.to_i * 10)), Ak47: (@inventory.Ak47 + (@trade.ak47c.to_i * 8)))
    @inventory.update(water: (@inventory.water - (@trade.watere.to_i * 14)),
                      soup: (@inventory.soup - (@trade.soupe.to_i * 12)), pouch: (@inventory.pouch - (@trade.pouche.to_i * 10)), Ak47: (@inventory.Ak47 - (@trade.ak47e.to_i * 8)))
    @inventory2.update(water: (@inventory2.water + (@trade.watere.to_i * 14)),
                       soup: (@inventory2.soup + (@trade.soupe.to_i * 12)), pouch: (@inventory2.pouch + (@trade.pouche.to_i * 10)), Ak47: (@inventory2.Ak47 + (@trade.ak47e.to_i * 8)))
    @inventory2.update(water: (@inventory2.water - (@trade.waterc.to_i * 14)),
                       soup: (@inventory2.soup - (@trade.soupc.to_i * 12)), pouch: (@inventory2.pouch - (@trade.pouchc.to_i * 10)), Ak47: (@inventory2.Ak47 - (@trade.ak47c.to_i * 8)))
    redirect_to user_path(current_user.id) , notice: 'Your Trade has been Done'
    @trade.destroy
  end

  def index;

  end

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
    params.permit(:sending_user_id, :recieving_user_id, :waterc, :watere, :soupc, :soupe, :pouchc, :pouche, :ak47e,:ak47c)
  end
end
