require 'docking_station'
describe DockingStation do
  describe '#release_bike' do
    it 'releases a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
    end
  end
  it 'releases working bikes' do
    bike = Bike.new
    docked_bike = subject.dock(bike)
    expect(docked_bike).to be_working
  end
  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
   end
   describe '#release_bike' do
   it 'raises an error when there are no bikes available' do
     expect { subject.release_bike }.to raise_error 'No bikes available'
   end
 end
end
