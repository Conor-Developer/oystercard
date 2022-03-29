require_relative '../lib/station'

describe Station do
  it 'Creates station name upon creation' do
    station = Station.new('Warren St', 1)
    expect(station).to have_attributes(station_name: 'Warren St')
  end

  it 'Creates zone number upon creation' do
    station = Station.new('Warren St', 1)
    expect(station).to have_attributes(zone: 1)
  end
end
