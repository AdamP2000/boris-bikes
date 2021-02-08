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
    expect(docked_bike.pop).to be_working
  end
  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end
   describe '#release_bike' do
     it 'raises an error when there are no bikes available' do
       expect { subject.release_bike }.to raise_error 'No bikes available'
     end
   end
   describe '#dock' do
     it 'raises an error when full' do
       DockingStation::DEFAULT_CAPACITY.times do
         subject.dock Bike.new
       end
        expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
  it 'has a default capacity' do
   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
 end
 describe 'initialization' do
  it 'has a variable capacity' do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock Bike.new }
    expect{ docking_station.dock Bike.new }.to raise_error 'Docking station full'
  end
end
describe 'initialization' do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end
end
it "does not release a broken bike" do
  bike = Bike.new
  bike.report_broken
  subject.dock(bike)
  expect{ subject.release_bike }.to raise_error 'No bikes available'
end
it "still docks bikes even if broken" do
  bike = Bike.new
  bike.report_broken
  expect(subject.dock(bike)).to eq [bike]
end
end
