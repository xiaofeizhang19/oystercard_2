require 'station'

describe Station do

  let (:station_1) { Station.new(1, 'Holborn') }

  describe 'initialize' do
    
    it 'has name variable' do
      expect(station_1.zone).to eq(1)
    end 

    it 'has zone variable' do
      expect(station_1.name).to eq('Holborn')
    end 
  end 
end 

