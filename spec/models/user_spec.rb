require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'validations' do
    context 'when name validations passed' do
      it { is_expected.to allow_value('Alina').for(:name) }
      it { is_expected.not_to allow_value('Alina12').for(:name) }
      it { is_expected.to validate_presence_of(:name)}
    end

    context 'when age validations passed' do
      it { should validate_inclusion_of(:age).in_range(18..90) }
      it { is_expected.to validate_presence_of(:age)}
    end

    context 'when longitude validations passed' do
      it { should validate_inclusion_of(:longitude).in_range(-180..180) }
      it { is_expected.to validate_presence_of(:longitude)}
    end

    context 'when latitude validations passed' do
      it { should validate_inclusion_of(:latitude).in_range(-90..90) }
      it { is_expected.to validate_presence_of(:latitude)}
    end

  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(Not_Infected: 0, Infected: 1)}

    it { should define_enum_for(:user_type).with_values(user: 0, admin: 1)}
  end

  describe 'Associations' do
    it { should have_one(:inventory).dependent(:destroy) }

    it { should have_many(:vote_reciever).through(:vote_sent_comparison) }
    it { should have_many(:vote_sent_comparison).class_name(:Vote).with_foreign_key(:vote_sent_id) }

    it { should have_many(:vote_sent).through(:vote_reciever_comparison) }
    it { should have_many(:vote_reciever_comparison).class_name(:Vote).with_foreign_key(:vote_reciever_id) }

    it { should have_many(:recieving_user).through(:sending_user_comparison) }
    it { should have_many(:sending_user_comparison).class_name(:Trade).with_foreign_key(:sending_user_id) }

    it { should have_many(:sending_user).through(:recieving_user_comparison) }
    it { should have_many(:recieving_user_comparison).class_name(:Trade).with_foreign_key(:recieving_user_id) }
  end

end
