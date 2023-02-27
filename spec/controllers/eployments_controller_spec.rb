require 'rails_helper'
RSpec.describe EmploymentsController, type: :controller do
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
      it "saves the new employment in the database" do
        expect {
          post :create, params: { employment: attributes_for(:employment) }
        }.to change(Employment, :count).by(1)
      end

      it "redirects to the employments index page" do
        post :create, params: { employment: attributes_for(:employment) }
        expect(response).to redirect_to employments_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new employment in the database" do
        expect {
          post :create, params: { employment: attributes_for(:employment, employer: nil) }
        }.not_to change(Employment, :count)
      end

      it "re-renders the new template" do
        post :create, params: { employment: attributes_for(:employment, employer: nil) }
        expect(response).to render_template :new
      end
    end
  end
end