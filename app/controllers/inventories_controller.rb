# frozen_string_literal: true
class InventoriesController < ApplicationController
  before_action :authorize_action, only: %i[new create index ]
  def index; end

  def new
    @inventory = Inventory.new
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
    authorize Inventory
  end

end
