require './lib/journeylog'

class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new(journey_class: Journey)
  end

  def top_up(amount)
    fail_if_balance_exceeded(amount)

    @balance += amount
  end

  def touch_in(station)
    fail_if_low_balance

    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(MINIMUM_FARE)
  end

  private

  def fail_if_balance_exceeded(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if 
      amount + balance > MAXIMUM_BALANCE
  end

  def fail_if_low_balance
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
  end

  def deduct(fare)
    @balance -= fare
  end
end
