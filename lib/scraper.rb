require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
    #doc
  end

  def get_courses
    #course_offerings = get_page.css('h2')
    course_offerings = get_page.css('.post')
    #puts course_offerings.class
  end

  def make_courses
    #puts "get courses is #{get_courses}"
    get_courses.each do |course|
      #puts "course is #{course}"

      #puts course.text.strip
      course_title = course.css("h2")
      course_description = course.css("p")
      course_schedule = course.css(".date")

      #course_var = course.text.strip 
      course = Course.new
      #puts course_var
      course.title = course_title.text.strip
      course.description = course_description.text.strip
      course.schedule = course_schedule.text.strip

      #puts "course title is #{course.title}"


    end

  end


  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



