

class JourneyLog

  attr_reader :entry_station, :exit_station, :journey_class

  def initialize(journey_class:)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    current_journey.enter(entry_station)
    @journeys << current_journey
  end

  def finish(exit_station)
    current_journey.exit(exit_station)
    @journeys << current_journey
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    !!@current_journey ? @current_journey : @journey_class.new  
  end
end

# log_1.current journey 