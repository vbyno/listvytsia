describe MicroGroups do
  describe 'region_names' do
    subject { described_class.region_names }

    context 'no regions' do
      it { is_expected.to eq [] }
    end

    context 'several regions' do
      let!(:region_1) { create :region, name: 'B', priority: 1 }
      let!(:region_2) { create :region, name: 'A', priority: 2 }

      it 'is sorted by priority desc' do
        is_expected.to eq [region_2.name, region_1.name]
      end
    end
  end
end
