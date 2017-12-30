describe Calendars::CalendarsController, type: :controller do
  routes { Calendars::Engine.routes }

  describe 'GET show' do
    let!(:item) { create :item }

    it 'returns items array' do
      get :show, format: :json

      expect(JSON.parse(response.body)).to contain_exactly(
        'id'         => item.id.to_s,
        'city'       => item.city,
        'start_date' => item.start_date,
        'end_date'   => item.end_date,
        'course'     => item.course,
        'contacts'   => item.contacts
      )
    end
  end
end
