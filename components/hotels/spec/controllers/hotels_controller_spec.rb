require 'spec_helper'

describe Hotels::HotelsController, type: :controller do
  routes { Hotels::Engine.routes }

  describe 'GET index' do
    let!(:hotel) { create :hotel }

    it 'returns hotels array' do
      get :index

      expect(JSON.parse(response.body)).to contain_exactly(
        'id' => hotel.id.to_s,
        "link"=>nil,
        "address"=> hotel.address,
        "title"=>hotel.title,
        "phone"=>hotel.phone,
        "price"=>hotel.price,
        "published"=>hotel.published
      )
    end
  end
end
