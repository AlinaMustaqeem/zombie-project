require 'rails_helper'
<<<<<<< HEAD

RSpec.describe Vote, type: :model do

  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }
  let!(:vote1) { FactoryBot.create(:vote, vote_sent_id:user1.id, vote_reciever_id:user2.id)}

=======
RSpec.describe Vote, type: :model do
>>>>>>> 4204f44defa0fa105d6dad66783af06aea649be7
  describe 'association' do
    it { should belong_to(:vote_sent).class_name(:User) }
    it { should belong_to(:vote_reciever).class_name(:User) }
  end
<<<<<<< HEAD

  describe 'scope' do
    context 'when equal' do
      it {expect(Vote.votes_count(user2)).to eq(Vote.where(vote_reciever_id:user2.id).count)}
    end

    context 'when not equal' do
      it {expect(Vote.votes_count(user2)).not_to eq(Vote.where(vote_reciever_id:user1.id).count)}
    end

  end
end

=======
end
>>>>>>> 4204f44defa0fa105d6dad66783af06aea649be7
