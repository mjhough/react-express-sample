require 'rails_helper'

RSpec.describe GeographicService do
  describe '.find_all_points' do
    subject { described_class.find_all_points(lat, lng, interval_distance, rings) }

    let(:lat) { -27.507 }
    let(:lng) { 153.093 }
    let(:interval_distance) { 500 }
    let(:rings) { 6 }

    context 'just a test' do
      it { is_expected.to be }
    end
  end
end
