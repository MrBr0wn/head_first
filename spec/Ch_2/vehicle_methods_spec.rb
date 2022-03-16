# frozen_string_literal: true

require 'Ch_2/vehicle_methods'

RSpec.describe 'Got-A-Motor' do
  it 'return messages for .accelerate' do
    out_str = "Stepping on the gas\nSpeeding up\n"
    expect { accelerate }.to output(out_str).to_stdout
  end

  it 'return messages for .sound_horn' do
    out_str = "Pressing the horn button\nBeep beep!\n"
    expect { sound_horn }.to output(out_str).to_stdout
  end

  it 'return messages for .use_headlights' do
    light = 'some light'
    out_str = "Turning on #{light} headlights\nWatch out for deer!\n"
    expect { use_headlights(light) }.to output(out_str).to_stdout
  end

  context 'with mileage' do
    trip = mileage(400, 12)
    lifetime = mileage(11_432, 366)

    it 'return trip mileage' do
      expect(trip).to eq 400 / 12
    end

    it 'return lifetime mileage' do
      expect(lifetime).to eq 11_432 / 366
    end

    it 'return 0 if gas_used = 0' do
      expect(mileage(100, 0)).to eq 0.0
    end

    it 'return Numeric' do
      expect(trip).to be_an_instance_of(Integer)
    end
  end
end
