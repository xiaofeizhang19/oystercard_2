require 'journeylog'

describe JourneyLog do
  let (:)
  let (:journey_log) { JourneyLog.new(Journey)}
  #let (:exit_station) { double :exit_station }

  describe '#initialize' do
    it 'takes a class of Journey as a parameter' do
      expect(journey_log.journey).to eq(Journey)
    end
  end

  describe '#start' do
    it 'should start a new journey with an entry station' do
      journey_log
      #expect(journey_log.journey).to eq(Journey)
    end

  end


end


=begin

  2.6.3 :007 > journeylog = JourneyLog.new(Journey)
  => #<JourneyLog:0x00007fade58da208 @journey=Journey>
      2.6.3 :008 > journey1 = Journey.new("Algate")
  => #<Journey:0x00007fade4902600 @entry_station="Algate">
      2.6.3 :009 > journeylog = JourneyLog.new(journey1)
  => #<JourneyLog:0x00007fade4913dd8 @journey=#<Journey:0x00007fade4902600 @entry_station="Algate">>
      2.6.3 :010 >

=end