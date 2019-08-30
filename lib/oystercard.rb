

class Oystercard

  attr_reader :balance, :journey_list 

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journey_list = []
  end

  def top_up(amount)
    fail_if_balance_exceeded(amount)

    @balance += amount
  end

  def touch_in(station)
    fail_if_low_balance

    @journey_list << { :entry => station, :exit => nil }
  end

  def touch_out(station)
    @journey_list[-1][:exit] = station
    deduct(MINIMUM_FARE)
  end

  private

  def fail_if_balance_exceeded(amount)
    if amount + balance > MAXIMUM_BALANCE
      fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded"
    end
  end

  def fail_if_low_balance
    if @balance < MINIMUM_FARE
      fail "Insufficient funds for journey"
    end
  end

  def deduct(fare)
    @balance -= fare
  end
end
