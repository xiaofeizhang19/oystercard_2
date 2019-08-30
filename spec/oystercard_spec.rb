require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe 'card balance' do

    it 'will start with a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'will increase balance with top up' do
      expect(subject.top_up(5)).to eq 5
    end

    it 'will raise error if maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end


  describe 'journey' do

    it 'raises error if balance is below minimum on touch in' do
      expect {subject.touch_in(entry_station)}.to raise_error "Insufficient funds for journey"
    end

    it 'charges fare amount during touch out' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(entry_station)
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end
end
