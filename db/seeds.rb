require 'open-uri'
require 'nokogiri'

reports_by_date_noko = Nokogiri::HTML(open('http://www.nuforc.org/webreports/ndxpost.html'))

links = reports_by_date_noko.css('td a').map { |element| "http://www.nuforc.org/webreports/#{element[:href]}" }

single_report_date_noko = Nokogiri::HTML(open('http://www.nuforc.org/webreports/ndxp980618.html'))

single_reports = single_report_date_noko.css('tbody tr')

reports_data = []

single_reports.each do |report|
  data_elements = report.css('td')
  Report.new
  single_report_data[:sighted] = data_elements[0].text
  single_report_data[:city] = data_elements[1].text
  single_report_data[:state] = data_elements[2].text
  single_report_data[:shape] = data_elements[3].text
  single_report_data[:duration] = data_elements[4].text
  single_report_data[:summary] = data_elements[5].text
  single_report_data[:posted] = data_elements[6].text
  reports_data << single_report_data
end

reports_data.each { |report| p report}
