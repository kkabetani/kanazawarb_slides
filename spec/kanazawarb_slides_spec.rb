require 'spec_helper'

describe KanazawarbSlides do

  describe 'meetup count' do
    it { expect(KanazawarbSlides.meetup_count).to be > 0 }
  end

  describe 'correct urls' do
    urls = KanazawarbSlides.collect

    it { expect(urls.size).to be > 0 }

    it 'uniq urls' do
      expect(urls.size - urls.uniq.size).to eq 0
    end
  end
end
