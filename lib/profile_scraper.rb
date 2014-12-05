require 'open-uri'
require 'pry'

class ProfileScraper

  def find_urls
    student_urls = Array.new
    base_url = "http://people.flatironschool.com/students"
    doc = Nokogiri::HTML(open(base_url))
    doc.css('.img-holder a').each do |div|
      url = base_url + div['href']
      student_urls << url
    end
    student_urls
  end

  def create_students
    find_urls
  end

end