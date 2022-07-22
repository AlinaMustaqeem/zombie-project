class HomeController < ApplicationController
  def new
    @user= User.new
  end
  def index
  end
end
