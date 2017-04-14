require 'open-uri'
require 'nokogiri'

Report.destroy_all

reports_by_date_noko = Nokogiri::HTML(open('http://www.nuforc.org/webreports/ndxpost.html'))

links = reports_by_date_noko.css('td a').map { |element| "http://www.nuforc.org/webreports/#{element[:href]}" }

single_report_date_noko = Nokogiri::HTML(open('http://www.nuforc.org/webreports/ndxp980618.html'))

single_reports = single_report_date_noko.css('tbody tr')

single_reports.each do |report|
  data_elements = report.css('td')
  Report.create(sighted: data_elements[0].text,
                city: data_elements[1].text,
                state: data_elements[2].text,
                shape: data_elements[3].text,
                duration: data_elements[4].text,
                summary: data_elements[5].text,
                posted: data_elements[6].text)
end

Report.all.each do |report|
  p report
end

