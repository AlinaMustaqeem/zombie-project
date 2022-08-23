class TradesController < ApplicationController
  def new
    # byebug
    # @user = User.find(params[:user_id])
    # @trade = Trade.new

  end

 def tradePage
    @user = User.find(params[:id])
    selected_point = params
    @sum = selected_point[:waterc].to_i*14+selected_point[:soupc].to_i*12+selected_point[:pouchc].to_i*10+selected_point[:ak47c].to_i*8
    @sume = selected_point[:watere].to_i*14+selected_point[:soupe].to_i*12+selected_point[:pouche].to_i*10+selected_point[:ak47e].to_i*8
    if((@sum == @sume) && (@sum != 0))
      Trade.create!(trade2_params.merge(sending_user_id: current_user.id , recieving_user_id: @user.id, request_status: :pending))
      flash[:success] = 'Trade Created successfully'
    else
      flash[:success] = 'Trade Can not be done'
    end
  end



  def accept_request
    @user = User.find(params[:id])
    @trade = Trade.find_by(sending_user_id: @user.id, recieving_user_id: current_user.id)
    @inventory = Inventory.find_by(user_id: @user.id)
    @inventory2 = Inventory.find_by(user_id: current_user.id)
    @inventory.update(water:(@inventory.water + (@trade.waterc.to_i*14)), soup: (@inventory.soup + (@trade.soupc.to_i*12)), pouch: (@inventory.pouch + (@trade.pouchc.to_i*10)) ,Ak47: (@inventory.Ak47 + (@trade.ak47c.to_i*8)))
    @inventory.update(water:(@inventory.water - (@trade.watere.to_i*14)), soup: (@inventory.soup - (@trade.soupe.to_i*12)), pouch: (@inventory.pouch - (@trade.pouche.to_i*10)) ,Ak47: (@inventory.Ak47 - (@trade.ak47e.to_i*8)))
    @inventory2.update(water:(@inventory2.water + (@trade.watere.to_i*14)), soup: (@inventory2.soup + (@trade.soupe.to_i*12)), pouch: (@inventory2.pouch + (@trade.pouche.to_i*10)) ,Ak47: (@inventory2.Ak47 + (@trade.ak47e.to_i*8)))
    @inventory2.update(water:(@inventory2.water - (@trade.waterc.to_i*14)), soup: (@inventory2.soup - (@trade.soupc.to_i*12)), pouch: (@inventory2.pouch - (@trade.pouchc.to_i*10)) ,Ak47: (@inventory2.Ak47 - (@trade.ak47c.to_i*8)))
    redirect_to user_path(@user.id)
  end

  def create
    # @trade = Trade.new(trade2_params)
    # @user = User.find(params[:user_id])
    # selected_point = params
    # @sum = selected_point[:water].to_i*14+selected_point[:soup].to_i*12+selected_point[:pouch].to_i*10+selected_point[:Ak47].to_i*8
    # @sume = selected_point[:watere].to_i*14+selected_point[:soupe].to_i*12+selected_point[:pouche].to_i*10+selected_point[:Ak47e].to_i*8
    # byebug
    # if (@sum == @sume)
    #   byebug
    #   @trade.pending!
    #   byebug
    #   redirect_to new_user_trade_path
    # else
    #   redirect_to new_user_trade_path
    # end
  end

  def index;
  end

  def destroy
    @user = User.find(params[:id])
    @trade = Trade.find_by(sending_user_id: @user.id, recieving_user_id: current_user.id)
    @trade.destroy
    redirect_to user_path(current_user)

  end


  private
  def trade_params
    params.permit!(:sending_user_id,:recieving_user_id,:waterc,:watere, :soupc,:soupe, :pouchc,:pouche, :ak47e,:ak47c, :user_id)
  end
  def trade2_params
    params.permit(:sending_user_id,:recieving_user_id,:waterc,:watere, :soupc,:soupe, :pouchc,:pouche, :ak47e,:ak47c)
  end
end
