require 'journeylog'

describe JourneyLog do

  let (:entry_station) { double :entry_station }

  subject { JourneyLog.new(journey_class: Journey.new) }

  describe '#start' do
    it 'should start a new journey with an entry station' do
      expect(subject.start(entry_station)).to eq(entry_station)
    end
  end
end
