describe Profiles::ProfilesController, type: :controller do
  routes { Profiles::Engine.routes }

  describe 'GET index' do
    let!(:profile) { create :profile }

    it 'returns profiles array' do
      get :index

      expect(JSON.parse(response.body)).to contain_exactly(
        'id' => profile.id.to_s,
        'first_name' => profile.first_name,
        'last_name' => profile.last_name,
        'published' => profile.published,
        'picture_url' => '#'
      )
    end
  end
end
