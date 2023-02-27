require 'rails_helper'

RSpec.describe Employment, type: :model do
  describe "validations" do
    it "requires an employer" do
      employment = Employment.new(date_started: Date.today, date_ended: Date.today)
      expect(employment).not_to be_valid
      expect(employment.errors[:employer]).to include("can't be blank")
    end

    it "requires a start date" do
      employment = Employment.new(employer: "Ahad Ali", date_ended: Date.today)
      expect(employment).not_to be_valid
      expect(employment.errors[:date_started]).to include("can't be blank")
    end

    it "requires an end date" do
      employment = Employment.new(employer: "Ahad Ali", date_started: Date.today)
      expect(employment).not_to be_valid
      expect(employment.errors[:date_ended]).to include("can't be blank")
    end
  end
end
