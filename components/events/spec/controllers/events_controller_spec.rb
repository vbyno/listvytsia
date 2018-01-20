describe Events::EventsController, type: :controller do
  routes { Events::Engine.routes }

  describe 'GET show' do
    let(:start_time) { Time.utc(2017, 01, 02) }
    let(:end_time) { Time.utc(2017, 02, 03) }
    let!(:event) { create :event, start_time: start_time, end_time: end_time }
    let(:result) { JSON.parse(response.body) }

    it 'returns events array' do
      get :show, format: :json

      expect(result.size).to eq 1

      expect(result.first).to eq(
        'id'         => event.id.to_s,
        'city'       => event.city,
        'start_time' => '2017-01-02',
        'end_time'   => '2017-02-03',
        'course'     => event.course,
        'contacts'   => event.contacts,
        'dates'      => '2.01 - 3.02.2017'
      )
    end
  end
end
