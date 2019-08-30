require 'journeylog'

describe JourneyLog do

  let (:journey) { double :journey }
  let (:journey_class) { double :journey_class, new: journey}
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }

  subject { described_class.new(journey_class: journey_class) }

  describe '#start' do
    it 'should save a journey' do
      allow(journey_class).to receive(:new).and_return journey
      allow(journey).to receive(:enter).and_return entry_station
      subject.start(entry_station)
      expect(subject.journeys).to include(journey)
    end
  end
end
