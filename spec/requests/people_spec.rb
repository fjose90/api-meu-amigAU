require 'rails_helper'

RSpec.describe "/people", type: :request do
  let!(:person) { create(:person) }
  let(:valid_attributes) { attributes_for :person }
  let(:invalid_attributes) { attributes_for :invalid_person }
  let(:valid_headers) { { "Content-Type" => "application/json" } }

  describe "GET /index" do
    it "renders a successful response" do
      get people_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get person_url(person), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Person' do
        expect do
          post people_url,
               params: { person: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Person, :count).by(1)
      end

      it 'renders a JSON response with the new person' do
        post people_url,
             params: { person: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Person' do
        expect do
          post people_url,
               params: { person: invalid_attributes }, headers: valid_headers, as: :json
        }.to change(Person, :count).by(0)
      end

      it 'renders a JSON response with errors for the new person' do
        post people_url,
             params: { person: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { attributes_for :person }

      it "updates the requested person" do
        patch person_url(person),
              params: { person: new_attributes }, headers: valid_headers, as: :json
        person.reload
        expect(person.name).to eq(new_attributes[:name])
      end

      it "renders a JSON response with the person" do

        patch person_url(person),
              params: { person: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
    
    context "with invalid parameters" do
      it "renders a JSON response with errors for the person" do

        patch person_url(person),
              params: { person: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested person' do
      person = Person.create! valid_attributes
      expect do
        delete person_url(person), headers: valid_headers, as: :json
      end.to change(Person, :count).by(-1)
    end
  end
end
