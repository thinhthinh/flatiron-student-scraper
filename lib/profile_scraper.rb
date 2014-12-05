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
    find_urls.each do |url|
      doc = Nokogiri::HTML(open(url))
      
      name_div = doc.at_css('h1').text
      class_span = doc.at_css('h1 span').text
      name_div.slice!(class_span)
      
      name = name_div
      phone_number = doc.at_css('.number a').text
      email = doc.at_css('.email a').text

      if doc.at_css('.twitter a')
        twitter = 'https' + doc.at_css('.twitter a')['href']
        Student.find_or_create_by(name: name, phone_number: phone_number, email: email, url: url, twitter: twitter)
      else 
        Student.find_or_create_by(name: name, phone_number: phone_number, email: email, url: url)
      end 
      
    end
  end

end