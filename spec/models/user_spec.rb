require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user factory' do
    let(:user) { FactoryGirl.create(:user) }

    let(:user) {
    User.new(
      :email => 'someone@example.com',
        :first_name => 'Ravi',
        :last_name => 'Shankar',
        :phone => '990-191-6142',
        :password => 'Password123',
        :password_confirmation => 'Password123'
    )
  }

    before(:each) do
      expect(user).to be_valid
    end

    context "user first name validation" do
      it 'requires first name' do
        user.first_name = nil
        expect(user).to be_invalid
      end

      it 'requires first name' do
        user.first_name = " "
        expect(user).to be_invalid
      end

      it 'exceeds the length of first name' do
        user.first_name = "abc"*100
        expect(user).to be_invalid
      end

      it 'exceeds the length of first name' do
        user.first_name = "ab"
        expect(user).to be_invalid
      end

      it 'exceeds the length of first name' do
        user.first_name = "Ravi12"
        expect(user).to be_invalid
      end

    end

    context "user last name validation" do
      it 'requires last name' do
        user.last_name = nil
        expect(user).to be_invalid
      end

      it 'requires last name' do
        user.last_name = " "
        expect(user).to be_invalid
      end

      it 'exceeds the length of last name' do
        user.last_name = "abc"*100
        expect(user).to be_invalid
      end

      it 'exceeds the length of last name' do
        user.last_name = "ab"
        expect(user).to be_invalid
      end

      it 'exceeds the length of last name' do
        user.last_name = "Ravi12"
        expect(user).to be_invalid
      end

    end

    context "user email validation" do
      it 'requires email' do
        user.email = nil
        expect(user).to be_invalid
      end

      it 'requires email' do
        user.email = " "
        expect(user).to be_invalid
      end

      it 'requires email' do
        user.email = "ravi.com"
        expect(user).to be_invalid
      end

      it 'requires email' do
        User.create!(
        :email => 'someone@example.com',
        :first_name => 'Ravi',
        :last_name => 'Shankar',
        :phone => '990-191-6142',
        :password => 'Password123',
        :password_confirmation => 'Password123'
      )
        expect(user).to be_invalid
      end

    end

    context "user password validation" do
      it 'requires password' do
        user.password = nil
        expect(user).to be_invalid
      end

      it 'requires password' do
        user.password = "Password@1"
        expect(user).to be_invalid
      end

      it 'requires password' do
        user.password = " "
        expect(user).to be_invalid
      end

    end

    context "user password confirmation validation" do
      it 'requires password confirmation' do
        user.password_confirmation = nil
        expect(user).to be_invalid
      end

      it 'requires password confirmation' do
        user.password_confirmation = " "
        expect(user).to be_invalid
      end
    end

    context "user phone" do
      it 'requires phone' do
        user.phone = nil
        expect(user).to be_invalid
      end

      it 'requires phone' do
        user.phone = " "
        expect(user).to be_invalid
      end
    end

  end
end
