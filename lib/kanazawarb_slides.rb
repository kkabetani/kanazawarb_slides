require 'kanazawarb_slides/version'
require 'open-uri'
require 'nokogiri'

module KanazawarbSlides

  def self.meetup_count
    main_page = Nokogiri::HTML(open('http://kanazawarb.github.io/meetup'))
    main_page.css('header ul li').size
  end

  def self.collect
    urls = []
    meetup_count.times do |time|
      begin
        doc = Nokogiri::HTML(
          open("http://kanazawarb.github.io/meetup/#{time.to_s}/report.html"))

        doc.css('a').each do |link|
          href = link.attributes['href'].value
          urls << href if href =~ /speakerdeck|slideshare/
        end
      rescue
        next
      end
    end
    urls.uniq!
  end
end
