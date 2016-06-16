require 'spec_helper'

describe Hotels::HotelsController, type: :controller do
  routes { Hotels::Engine.routes }

  describe 'GET index' do
    let!(:hotel) { create :hotel }

    it 'returns hotels array' do
      get :index

      binding.pry
      expect(response).to eq [hotel]
    end
  end
end
