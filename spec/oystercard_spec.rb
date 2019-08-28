require 'oystercard'

describe Oystercard do

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

    it 'will decrease when fare is charged' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.deduct 1}.to change{ subject.balance }.by -1
    end
  end

  describe 'journey' do

    it { is_expected.to respond_to(:touch_in) }
    it { is_expected.to respond_to(:touch_out) }

    it 'intializes in journey as false' do
      expect(subject.in_journey).to eq false
    end

    it 'raises error if balance is below minimum on touch in' do
      expect {subject.touch_in}.to raise_error "Insufficient funds for journey" 
    end

    it 'saves journey state on touch-in' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

    it 'saves journey state on touch out' do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end
end
