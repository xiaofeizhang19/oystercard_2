require 'journeylog'

describe JourneyLog do

  let (:journey) { double :journey }
  let (:journey_class) { double :journey_class, new: journey}
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }

  subject { described_class.new(journey_class) }

  describe '#start' do

  end

  describe '#finish' do
    it 'should finish a journey with an exit station' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(entry_station)
      # subject.finish(exit_station)
      expect(subject.journeys).to include(journey)
    end
  end
end
