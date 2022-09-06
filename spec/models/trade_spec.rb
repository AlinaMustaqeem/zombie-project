require 'rails_helper'
RSpec.describe Trade, type: :model do

  describe 'association' do
    it { should belong_to(:sending_user).class_name(:User) }
    it { should belong_to(:recieving_user).class_name(:User) }
  end

  describe 'enums' do
    it { should define_enum_for(:request_status).with_values(rejected: 0, accepted: 1, pending:2)}
  end
  
end
