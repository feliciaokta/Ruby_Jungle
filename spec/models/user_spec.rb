require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validation' do
    it "password" do
      @user = User.new(first_name: 'asdf', last_name: 'jkl', password: 'password1', password_confirmation: 'aaa1111', email: 'test@test.COM')
      @user.valid?
      expect(@user.errors.full_messages).to eql(["Password confirmation doesn't match Password"])
    end

    it "email" do
      @email = User.new(first_name: 'asdf', last_name: 'jkl', password: 'password1', password_confirmation: 'password1', email: 'TEST@TEST.com')
      @email.save
      @email2 = User.new(first_name: 'asdf', last_name: 'jkl', password: 'password1', password_confirmation: 'password1', email: 'test@test.COM')
      @email2.valid?
      expect(@email2.errors.full_messages).to eql(["Email has already been taken"])
    end

    it "without email" do
      @wo_email = User.new(first_name: 'asdf', last_name: 'jkl', password: 'password1', password_confirmation: 'password1')
      @wo_email.valid?
      expect(@wo_email.errors.full_messages).to eql(["Email can't be blank"])
    end

    it "without first_name" do
      @wo_first_name = User.new(last_name: 'jkl', password: 'password1', password_confirmation: 'password1', email: 'TEST@TEST.com')
      @wo_first_name.valid?
      expect(@wo_first_name.errors.full_messages).to eql(["First name can't be blank"])
    end

    it "without last_name" do
      @wo_last_name = User.new(first_name: 'asdf', password: 'password1', password_confirmation: 'password1', email: 'TEST@TEST.com')
      @wo_last_name.valid?
      expect(@wo_last_name.errors.full_messages).to eql(["Last name can't be blank"])
    end

    it "password minimum length >= 6" do
      @password_min_length = User.new(first_name: 'asdf', last_name: 'jkl', password: '1234', password_confirmation: '1234', email: 'TEST@TEST.com')
      @password_min_length.valid?
      expect(@password_min_length.errors.full_messages).to eql(["Password is too short (minimum is 6 characters)"])
    end

  end

end
