require 'rails_helper'
RSpec.describe InventoriesController, type: :controller do
  let (:user1) { create(:user) }
  let (:user2) { create(:user, :admin) }
  let (:goods) { create(:inventory) }
  let (:inventory_params) { attributes_for(:inventory, user_id:user1.id) }
  let (:invalid_goods) { attributes_for(:invalid_params) }

  describe 'Get inventory#new' do
    context 'Inventory by user' do
      before 'User Sign-in' do
        sign_in user1
        get :new
      end
      it 'Should render a template of new' do
        should render_template('new')
        expect(response.status).to eq 200
      end
    end

    context 'Inventory by admin' do
      before 'Admin Sign-in' do
        sign_in user2
        get :new
      end
      it 'Should not allow to create' do
        expect(flash[:alert]).to eq('You are not authorized to perform this action')
      end
      it 'Should not be authorized' do
        expect(response).to redirect_to(users_path)
        expect(response.status).to eq 302
      end
    end
  end

  describe 'POST inventory#create' do
    before do
      sign_in user1
    end
    context 'Inventory with valid params' do
      before do
        post :create , params: {:inventory => inventory_params }
      end
      it 'should create an inventory' do
        expect do
          post :create , params: {:inventory => inventory_params }
        end.to change(Inventory, :count).by(1)
      end

      it 'should redirect to given path' do
        expect(response).to redirect_to(user_path(user1.id))
        expect(response.status).to eq 302
      end

      it 'should show success' do
        expect(flash[:notice]).to eq('saved succesfuly')
      end
    end

    context 'Inventory with Invalid params' do
      before do
        post :create , params: {:inventory => invalid_goods}
      end

      it 'should not create an inventory' do
        expect do
          post :create , params: {:inventory => invalid_goods}
        end.to change(Inventory , :count).by(0)
      end

      it 'should show alert' do
        expect(flash[:alert]).to eq('Please Enter Inventory')
      end

      it 'should render new template' do
        should render_template('new')
        expect(response.status).to eq 200
      end
    end
  end

  describe 'when user do not sign-in' do
    context 'Creating Inventory' do
      before do
        post :create , params: {:inventory => invalid_goods}
      end

      it 'should not create an inventory' do
        expect do
          post :create , params: {:inventory => invalid_goods}
        end.to change(Inventory , :count).by(0)
      end

      it 'should ask user to sign-in' do
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end

    end
  end
end
