# frozen_string_literal: true

# require '../lib/first_program'

describe 'First program' do
  context 'welcome messages' do
    it 'should puts messages' do
      expect { print('Welcome to \'Get My Number!\'') }.to output.to_stdout
      expect { print('I\'ve got a random number between 1 and 100.') }.to output.to_stdout
    end
  end

  context 'user\'s input' do
    it 'should name not to be empty' do
      allow($stdin).to receive(:gets) { 'Name' }
      expect($stdin.gets).to eq 'Name'
    end
  end
end
