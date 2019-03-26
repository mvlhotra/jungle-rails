require 'rails_helper'

RSpec.describe User, type: :model do
  subject{ described_class.new(:first_name => "Nik", :last_name => "Mal", :email => "dog@dog.com")}
  describe 'Validations' do
    it{should validate_presence_of(:first_name)}
    it{should validate_presence_of(:last_name)}
    it{should validate_presence_of(:email)}
    it{should validate_uniqueness_of(:email).ignoring_case_sensitivity}
    it{should validate_presence_of(:password)}
    it{should validate_presence_of(:password_confirmation)}
    it{should validate_length_of(:password).is_at_least(5)}
    it "is valid with matching password/password confirmation values" do
      expect(subject.password).to eql(subject.password_confirmation)
    end
    it "is invalid with mismatching password/password confirmation values" do
      subject.password = 'dada'
      expect(subject.password).to_not eql(subject.password_confirmation)
    end
  end
  describe '.authenticate_with_credentials' do
    before(:each) do
      User.destroy_all 
      @user = User.create!(first_name: "Big", last_name: "Sean", email: "dog@dog.com", password: "123123", password_confirmation: "123123")
    end 
    it 'Should allow a user to login if they have extra spaces on their email input' do
      expect(User.authenticate_with_credentials(" #{@user.email}     ", @user.password)).to eql(@user)
    end

    it 'Should allow a user to login if they type their email in wrong case' do
      expect(User.authenticate_with_credentials("dOg@DoG.com", @user.password)).to eql(@user)
    end
    it 'Should not allow a user to login with an invalid username' do
      expect(User.authenticate_with_credentials('asdf@doggoh.com', @user.password)).to eql(nil)
    end
    it 'Should not allow a user to login with an invalid password' do
      expect(User.authenticate_with_credentials(@user.email, '456456')).to eql(nil)
    end
    it 'Should allow a user to login with valid credentials' do
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eql(@user)
    end
  end
end
