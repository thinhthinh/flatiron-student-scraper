desc "Scrape students"
task :scrape_students => :environment do
  scraper = ProfileScraper.new
  scraper.create_students
end