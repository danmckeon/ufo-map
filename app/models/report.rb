class Report < ActiveRecord::Base
  def self.calculate_frequencies
    frequencies = Report.group("state").group("city").order("count_id desc").count("id")

  end
end
