require 'rails_helper'
RSpec.describe Vote, type: :model do
  describe 'association' do
    it { should belong_to(:vote_sent).class_name(:User) }
    it { should belong_to(:vote_reciever).class_name(:User) }
  end
end
