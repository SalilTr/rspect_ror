# Example structure of a spec file
require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    let(:post1) { FactoryBot.create(:post) }
  describe 'GET #index' do
    it 'returns successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns successful response' do
        get :show ,params: { id: post1.id }
        expect(response).to be_successful
    end
  end

end
