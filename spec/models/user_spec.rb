require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { FactoryBot.build(:user) }

    context 'Should Validate' do
      it 'with valid fields ' do
        expect(user).to be_valid
      end
    end

    context 'When email is not valid' do
      let(:user) { FactoryBot.build(:user, email: nil) }

      it "is not valid" do
        expect(user).to_not be_valid
      end
    end

end
