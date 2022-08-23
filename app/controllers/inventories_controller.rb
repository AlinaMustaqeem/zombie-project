# frozen_string_literal: true

class InventoriesController < ApplicationController
  def index; end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.create(inventory_params)
    @inventory.total_qty = @inventory.water / 14 + @inventory.soup / 12 + @inventory.pouch / 10 + @inventory.Ak47 / 8
    if @inventory.save
      redirect_to user_path(current_user.id), notice: 'saved succesfuly'
    else
      render 'new', alert: 'Please Enter Inventory'
    end
  end

  # def accept
  #   @user = User.find(params[:id])
  #   @a = Trade.where(sending_user_id: @user.id, recieving_user_id:current_user.id)
  #   byebug

  # end

  private

  def inventory_params
    params.require(:inventory).permit(:water, :soup, :pouch, :Ak47, :total_qty).merge(user_id: current_user.id)
  end
end
