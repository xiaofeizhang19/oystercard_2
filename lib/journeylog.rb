class JourneyLog

  attr_reader :journey
  attr_reader :entry_station

  def initialize(journey_class: )
    @journey_class = journey_class
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  private

  def current_journey
    @current_journey.initialize(entry_station)
  end
end

# log_1.current journey 