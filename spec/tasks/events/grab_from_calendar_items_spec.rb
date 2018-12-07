xdescribe Tasks::Events::GrabFromCalendarItems do
  describe '.call' do
    let!(:calendar_item) { create :item, city: city_name }
    let(:task) { double(:task) }
    let(:attributes) { double(:attributes) }

    subject { described_class.call(task, attributes) }

    context 'region exists' do
      let(:city) { create :region }
      let(:city_name) { city.name }

      it 'creates new events based on calendar items' do
        expect { subject }.
          to change { Events::Event.count }.by(1)
          .and change { calendar_item.reload.event_id }.from(nil)
          .and change { calendar_item.reload.start_date.hour }.from(0).to(9)
      end
    end

    context 'appropriate regions does not exist' do
      let(:city_name) { 'unexisting' }

      it 'does not create an event' do
        expect { subject }.not_to change { Events::Event.count }
      end
    end
  end
end
