# require 'rails_helper'
# require 'spec_helper'
# # require_relative '../support/devise'
# RSpec.describe VotesController, type: :controller do

#  let!(:user1) { create(:user) }
#  let!(:user2) { create(:user) }
# #  let!(:vote1) { FactoryBot.create(:vote, vote_sent_id:user1.id, vote_reciever_id:user2.id)}

#   before  do
#   sign_in user1
#   end

#   describe 'Assigning vote instance' do
#     context 'create vote with valid params' do
#       before do
#         post :create , params:{ user: user2.id}
#       end
#       it 'should create a vote' do
#         expect do
#           post :create , params:{ user: user2.id}
#         end.to change(Vote , :count).by(1)
#       end
#       it 'should display alert' do
#         expect(flash[:success]).to eq('Voted')
#       end
#       it 'should display alert' do
#         expect(response).to redirect_to(user_path(user2))
#       end
#     end
#   end

#   context 'create vote with valid params' do
#     before do
#       post :create , params:{ user: nil}
#     end
#     it 'should display alert' do
#       expect(response).to redirect_to(users_path)
#     end
#     it 'should display alert' do
#       expect(flash[:alert]).to eq("Record Does Not Exist")
#     end
#   end
# end
