require 'open-uri'
require 'nokogiri'

Report.destroy_all

post_date_nokos = Nokogiri::HTML(open('http://www.nuforc.org/webreports/ndxpost.html'))

post_date_links = post_date_nokos.css('td a').map { |element| "http://www.nuforc.org/webreports/#{element[:href]}" }

post_date_links.each do |post_date_link|
  single_post_date_noko = Nokogiri::HTML(open(post_date_link))
  single_post_date_reports = single_post_date_noko.css('tbody tr')
  single_post_date_reports.each do |report|
    data_elements = report.css('td')
    Report.create(sighted: data_elements[0].text,
                  city: data_elements[1].text,
                  state: data_elements[2].text,
                  shape: data_elements[3].text,
                  duration: data_elements[4].text,
                  summary: data_elements[5].text,
                  posted: data_elements[6].text)
  end
end
