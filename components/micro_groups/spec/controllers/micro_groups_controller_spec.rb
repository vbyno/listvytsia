describe MicroGroups::MicroGroupsController, type: :controller do
  routes { MicroGroups::Engine.routes }

  describe 'GET index' do
    let!(:micro_group) { create :micro_group }

    it 'returns micro_groups array' do
      get :index, format: :json

      expect(JSON.parse(response.body)).to contain_exactly(
        'id'            => micro_group.id.to_s,
        'name'          => micro_group.name,
        'city'          => micro_group.city,
        'idea'          => micro_group.idea,
        'leaders'       => micro_group.leaders,
        'contacts'      => micro_group.contacts,
        'methodologies' => micro_group.methodologies,
        'published'     => micro_group.published
      )
    end
  end
end
