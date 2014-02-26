require 'spec_helper'

describe KanazawarbSlides do

  describe "meetup count" do
    it { expect(KanazawarbSlides.meetup_count).to be > 0 }
  end

  describe "correct urls" do
    urls = KanazawarbSlides.collect

    it { expect(urls.size).to be > 0 }

    it "uniq urls" do
      expect(urls.size - urls.uniq.size).to eq 0
    end
  end

  describe "omitted url" do

    describe "one time redirect" do
      tco_url = "https://t.co/DyfjrVazCG"
      original_url = "https://speakerdeck.com/kkabetani/kanazawa-dot-rb-slides"

      it "convert to correct original url" do
        expect(KanazawarbSlides.convert_to_original_url(tco_url)).to eq original_url
      end
    end

    describe "many times redirect" do
      tco_url = "http://t.co/qPedglEadF"
      original_url = "http://www.slideshare.net/tomokazu/textobjects-vims-elegant-function"

      it "convert to correct original url" do
        expect(KanazawarbSlides.convert_to_original_url(tco_url)).to eq original_url
      end

      it "raise exception for too deep" do
        expect { KanazawarbSlides.convert_to_original_url(tco_url, 1) }.to raise_error(ArgumentError)
      end
    end

    describe "not found response" do
      tco_url = "http://kanazawarb.github.io/meetup/notfound.html"

      it "return nil" do
        expect(KanazawarbSlides.convert_to_original_url(tco_url)).to eq nil
      end
    end
  end
end
