class Station

  attr_reader :name
  attr_reader :zone

  def initialize(zone, name)
    @name = name
    @zone = zone
  end
end