require 'spec_helper'

describe Hotels::HotelsController, type: :controller do
  routes { Hotels::Engine.routes }

  describe 'GET index' do
    let!(:hotel) { create :hotel }

    it 'returns hotels array' do
      get :index

      expect(response.body).to eq [hotel]
    end
  end
end
