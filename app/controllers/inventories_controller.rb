# frozen_string_literal: true

class InventoriesController < ApplicationController
  before_action :points_value

  def index; end

  def new
    @inventory = Inventory.new
  end

  def create
    # byebug
    @inventory = Inventory.create(inventory_params)
    if @inventory.save
      redirect_to user_path(current_user.id), notice: 'saved succesfuly'
    else
      render 'new'
    end
  end

  private

  def inventory_params
    # byebug
    params.require(:inventory).permit(:water, :soup, :pouch, :Ak47).merge(user_id: current_user.id)
  end

  def points_value
    params[:inventory][:water] = params[:inventory][:water].to_i * 14
    params[:inventory][:soup] = params[:inventory][:soup].to_i * 12
    params[:inventory][:pouch] = params[:inventory][:pouch].to_i * 10
    params[:inventory][:Ak47] = params[:inventory][:Ak47].to_i * 8
  end
end
