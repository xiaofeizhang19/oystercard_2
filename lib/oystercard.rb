class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journey_list

  def initialize
    @balance = 0
    @journey_list = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @entry_station = station
    @journey_list << {:entry => @entry_station, :exit => nil}
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey_list[-1][:exit] = station
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
