# frozen_string_literal: true

require 'Ch_9/mixins'

RSpec.describe Clip do
  context 'superclass' do
    it 'should have #play' do
      expect(described_class.instance_methods.include?(:play)).to be true
    end

    it 'should haven\'t #add_comment' do
      expect(described_class.instance_methods.include?(:add_comment)).to be false
    end
  end

  context 'subclasses' do
    describe Video do
      let(:video) { described_class.new }

      it 'should include module AcceptsComments' do
        expect(described_class.included_modules.include?(AcceptsComments)).to eq true
      end

      it 'should be kind of Clip' do
        expect(video).to be_kind_of(Clip)
      end

      it 'should have instance method #add_comment from module' do
        expect(video.methods.include?(:add_comment)).to be true
      end

      it 'should return array of comments' do
        expect(video.add_comment('test')).to eq(['test'])
      end

      it 'should have @resolution' do
        video.resolution = '1080'
        expect(video.resolution).to eq('1080')
      end
    end

    describe Song do
      let(:song) { described_class.new }

      it 'should be kind of Clip' do
        expect(song).to be_kind_of(Clip)
      end

      it 'should have instance method #add_comment from module' do
        expect(song.methods.include?(:add_comment)).to be true
      end

      it 'should return array of comments' do
        expect(song.add_comment('test')).to eq(['test'])
      end

      it 'should have @beats_per_minute' do
        song.beats_per_minute = 120
        expect(song.beats_per_minute).to eq(120)
      end

      it 'should include module AcceptsComments' do
        expect(described_class.included_modules.include?(AcceptsComments)).to eq true
      end
    end

    describe Photo do
      let(:photo) { described_class.new }

      it 'should be kind of Clip' do
        expect(photo).to be_kind_of(Clip)
      end

      it 'should have instance method #add_comment from module' do
        expect(photo.methods.include?(:add_comment)).to be true
      end

      it 'should return array of comments' do
        expect(photo.add_comment('test')).to eq(['test'])
      end

      it 'should have @format default value is JPEG' do
        expect(photo.instance_variable_get(:@format)).to eq('JPEG')
      end

      it 'should include module AcceptsComments' do
        expect(described_class.included_modules.include?(AcceptsComments)).to eq true
      end
    end
  end
end
