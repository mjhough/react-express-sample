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


  describe '.get_hilliness' do
    subject { google_service.get_hilliness(points) }

    let(:google_service) { described_class.new(lat: lat, lng: lng) }
    let(:points) { google_service.get_all_elevations }
    let(:lat) { -27.507 }
    let(:lng) { 153.093 }

    context 'find hilliness score' do
      it { is_expected.to be }
    end
  end
end
