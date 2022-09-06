require 'rails_helper'
RSpec.describe VotesController, type: :controller do

 let(:user1) { create(:user) }
 let(:user2) { create(:user) }

  describe 'POST votes#create' do
    before 'must sign-in'  do
      sign_in user1
   end
    context 'When create vote with valid record' do
      before do
        post :create , params:{ user: user2.id}
      end
      it 'should increase the vote count by 1' do
        expect do
          post :create , params:{ user: user2.id}
        end.to change(Vote , :count).by(1)
      end
      it 'should display success' do
        expect(flash[:success]).to eq('Voted')
      end
      
      it 'should go to show page ' do
        expect(response).to redirect_to(user_path(user2))
        expect(response.status).to eq 302
      end
    end

    context 'When create with invalid record' do
      before do
        post :create , params:{ user: nil}
      end
      it 'should go to index page' do
        expect(response).to redirect_to(users_path)
        expect(response.status).to eq 302
      end
      it 'should falsh alert' do
        expect(flash[:alert]).to eq('Record Does Not Exist')
      end
    end

    context 'when vote is not created' do
      before do
        allow(Vote).to receive(:new).and_return(@vote)
        allow(@vote).to receive(:save).and_return(false)
        post :create , params:{ user: user2.id}
      end

      it 'should not increment the vote count' do
        expect do
          post :create , params:{ user: user2.id}
        end.to change(Vote , :count).by(0)
      end

      it 'should show that alert' do
        expect(flash[:alert]).to eq('Try Again')
      end
    end
  end

  describe 'Creating Vote' do
    context 'when user do not sign-in ' do
      before do
        post :create , params: {:user => user2.id}
      end

      it 'should not create a Vote' do
        expect do
          post :create , params: {:user => user2.id}
        end.to change(Inventory , :count).by(0)
      end

      it 'should ask user to sign-in' do
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end
  end
end
