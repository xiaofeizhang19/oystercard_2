class Journey 

  attr_reader :entry_station
  attr_reader :exit_station

  def enter(entry_station = nil)
    @entry_station = entry_station
  end
  
  def exit(exit_station = nil)
    @exit_station = exit_station
  end

  def calculate_fare
    incomplete_journey? ? Oystercard::PENALTY_FARE : Oystercard::MINIMUM_FARE
  end

  private

  def incomplete_journey?
    !@entry_station || !@exit_station
  end
end 
