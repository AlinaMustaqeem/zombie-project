# frozen_string_literal: true

class InventoriesController < ApplicationController

  def new
    @inventory = Inventory.new
    authorize @inventory
  end

  def create
    @inventory = Inventory.new(inventory_params)
    authorize @inventory
    if @inventory.save
      flash[:notice] = 'saved succesfuly'
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = 'Please Enter Inventory'
      render 'new'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:water, :soup, :pouch, :Ak47, :total_qty).merge(user_id: current_user.id)
  end

end
