require 'rails_helper'

RSpec.describe PersonalDataController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new personal data in the database" do
        expect {
          post :create, params: { personal_data: attributes_for(:personal_data) }
        }.to change(PersonalData, :count).by(1)
      end

      it "redirects to the employments index page" do
        post :create, params: { personal_data: attributes_for(:personal_data) }
        expect(response).to redirect_to employments_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new personal data in the database" do
        expect {
          post :create, params: { personal_data: attributes_for(:personal_data, first_name: nil) }
        }.not_to change(PersonalData, :count)
      end

      it "re-renders the new template" do
        post :create, params: { personal_data: attributes_for(:personal_data, first_name: nil) }
        expect(response).to render_template :new
      end
    end
  end
end
