require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'association' do
    it {is_expected.to belong_to(:user)}
  end
  describe 'validations' do
    context 'when water validations passed' do
      it {is_expected.to validate_numericality_of(:water)}
      it {is_expected.to validate_presence_of(:water)}
    end

    context 'when soup validations passed' do
      it {is_expected.to validate_numericality_of(:soup)}
      it {is_expected.to validate_presence_of(:soup)}
    end

    context 'when Ak47 validations passed' do
      it {is_expected.to validate_numericality_of(:Ak47)}
      it {is_expected.to validate_presence_of(:Ak47)}
    end

    context 'when pouch validations passed' do
      it {is_expected.to validate_numericality_of(:pouch)}
      it {is_expected.to validate_presence_of(:pouch)}
    end
  end

  describe 'methods' do
    context 'when points updated' do
      let!(:user1) {FactoryBot.create(:user)}
      let!(:inventory) {FactoryBot.build(:inventory,user_id:user1.id)}
      let!(:water_value) {inventory.water}
      it 'check callback' do
        inventory.update_points
        expect(inventory.water).to eq(water_value * WATER_POINTS)
      end
    end
  end
end
