class VotesController < ApplicationController

  before_action :set_user, only: %i[create]

  def create
    @vote = Vote.new(vote_sent_id: current_user.id, vote_reciever_id: @user.id)
    if @vote.save
      redirect_to user_path(@user)
      flash[:success] = 'Voted'
    else
      flash[:Alert] = 'Try Again'
    end
  end

  private
  def set_user
    @user = User.find(params[:user])
  end

end

