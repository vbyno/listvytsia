describe Calendars::CalendarsController, type: :controller do
  routes { Calendars::Engine.routes }

  describe 'GET show' do
    let(:start_date) { Time.utc(2017, 01, 02) }
    let(:end_date) { Time.utc(2017, 02, 03) }
    let!(:item) { create :item, start_date: start_date, end_date: end_date }
    let(:result) { JSON.parse(response.body) }

    it 'returns items array' do
      get :show, format: :json

      expect(result.size).to eq 1

      expect(result.first).to eq(
        'id'         => item.id.to_s,
        'city'       => item.city,
        'start_date' => '2017-01-02',
        'end_date'   => '2017-02-03',
        'course'     => item.course,
        'contacts'   => item.contacts,
        'dates'      => '2.01 - 3.02.2017'
      )
    end
  end
end
