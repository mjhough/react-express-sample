require 'rails_helper'

RSpec.describe GoogleService do
  describe '.get_all_elevations' do
    subject { described_class.new(lat: lat, lng: lng).get_all_elevations }

    let(:lat) { -27.507 }
    let(:lng) { 153.093 }

    context 'find all elevations' do
      it { is_expected.to be }
    end
  end
end
