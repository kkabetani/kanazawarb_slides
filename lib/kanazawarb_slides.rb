require 'kanazawarb_slides/version'
require 'open-uri'
require 'nokogiri'
require 'net/http'

module KanazawarbSlides

  TARGET_SLIDE_SERVICE=/speakerdeck|slideshare/

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
          if href =~ TARGET_SLIDE_SERVICE
            urls << href
          elsif href =~/t\.co/
            original_url = convert_to_original_url(href)
            urls << original_url if original_url =~ TARGET_SLIDE_SERVICE
          end
        end
      rescue
        next
      end
    end
    urls.uniq!
  end

  def self.convert_to_original_url(omission_url, limit = 10)
    raise ArgumentError, 'http redirect too deep' if limit == 0

    response = Net::HTTP.get_response(URI.parse(omission_url))
    case response
    when Net::HTTPSuccess then
      omission_url
    when Net::HTTPRedirection then
      convert_to_original_url(response["location"], limit - 1)
    else
      nil
    end
  end
end
