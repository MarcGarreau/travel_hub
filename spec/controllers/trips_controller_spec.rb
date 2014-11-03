require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  include Builders
  let(:user) { User.create!(name: "John Doe") }

  describe "GET new" do
    it "assigns a new trip @trip" do
      get :new
      expect(assigns(:trip)).to be_a_new(Trip)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "saves the new trip in the database" do
        trip_attributes

        expect { post :create, trip: @attributes}.to change(Trip, :count).by 1
      end

      it "redirects to the trip's show page" do
        trip_attributes
        post :create, trip: @attributes

        expect(response).to redirect_to feed_path
      end
    end

    describe "with invalid params" do
      xit "does not save the new trip in the database" do
      end

      xit "re-renders the :new template" do
      end
    end
  end
end
