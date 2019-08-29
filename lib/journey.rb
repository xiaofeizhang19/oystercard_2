class Journey 

  attr_reader :entry_station
  attr_reader :exit_station

  def initialize(station_name)
    @entry_station = station_name
  end
  
  def exit(exit_stn)
    @exit_station = exit_stn
  end

  def calculate_fare
    @entry_station && @exit_station ? 1 : 6
  end

end 
