# frozen_string_literal: true

class InventoriesController < ApplicationController

  def new
    @inventory = Inventory.new
    authorize @inventory
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to user_path(current_user.id), notice: 'saved succesfuly'
    else
      render 'new', alert: 'Please Enter Inventory'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:water, :soup, :pouch, :Ak47, :total_qty).merge(user_id: current_user.id)
  end

  def authorize_action
    authorize @user
  end
end
