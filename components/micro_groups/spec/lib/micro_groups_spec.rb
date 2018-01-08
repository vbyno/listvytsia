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

  describe '.links_info' do
    subject { described_class.links_info }

    context 'no regions exist' do
      it 'returns empty array' do
        is_expected.to be_empty
      end
    end

    context 'region exists' do
      let!(:region) { create :region }

      it 'returns region name and region permalink' do
        subject.first.tap do |region_info|
          expect(region_info.permalink).to eq region.permalink
          expect(region_info.name).to eq region.name
        end
      end
    end

    context 'several regions exist' do
      let!(:region_1) { create :region, priority: 1 }
      let!(:region_2) { create :region, priority: 2 }

      it 'sorts regions by priority' do
        expect(subject.first.permalink).to eq region_2.permalink
        expect(subject.last.permalink).to eq region_1.permalink
      end
    end

    context 'unpublished' do
      let!(:region) { create :region, published: false }

      it { is_expected.to be_empty }
    end
  end
end
