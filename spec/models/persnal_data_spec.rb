require 'rails_helper'

RSpec.describe PersonalData, type: :model do
  describe "validations" do
    it "requires a first name" do
      personal_data = PersonalData.new(last_name: "Ahad", email: "ahad@gmail.com", phone_number: "555-555-5555")
      expect(personal_data).not_to be_valid
      expect(personal_data.errors[:first_name]).to include("can't be blank")
    end

    it "requires a last name" do
      personal_data = PersonalData.new(first_name: "Ali", email: "ahad@gmail.com", phone_number: "555-555-5555")
      expect(personal_data).not_to be_valid
      expect(personal_data.errors[:last_name]).to include("can't be blank")
    end

    it "requires an email address" do
      personal_data = PersonalData.new(first_name: "Ahad", last_name: "Ali", phone_number: "555-555-5555")
      expect(personal_data).not_to be_valid
      expect(personal_data.errors[:email]).to include("can't be blank")
    end

    it "requires a valid phone number" do
      personal_data = PersonalData.new(first_name: "Ahad", last_name: "Ali", email: "ahad@gmail.com", phone_number: "invalid")
      expect(personal_data).not_to be_valid
      expect(personal_data.errors[:phone_number]).to include("is not a valid phone number")
    end
  end
end
