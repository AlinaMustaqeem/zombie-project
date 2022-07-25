class InventoriesController < ApplicationController
  def index
  end

  def new
    @inventory = Inventory.new
  end

  def create
    # byebug
    # byebug
    @inventory = Inventory.create(inventory_params)
    if @inventory.save
      redirect_to user_path(current_user.id), notice: "saved succesfuly"
    else
      render 'new'
    end
  end

  private
  def inventory_params
    # byebug
    params.require(:inventory).permit(:water, :soup, :pouch, :Ak47).merge(user_id: current_user.id)
  end

end
