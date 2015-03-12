require_relative 'post.rb'
require_relative 'comment.rb'
# require_relative 'post.html'
# require 'active_support/all'
require 'nokogiri'
require 'pry'


url_to_scrape = '/home/julian/Documents/Lighthouse/w2/d3/scraper/post.html'
doc = Nokogiri::HTML(File.open(url_to_scrape))

 title = doc.search('.title > a').map { |link| link.inner_text}
 linked_url = doc.search('.title > a').map { |link| link['href']}
 points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}
 item_id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
 parsed_doc = doc

usernames =  doc.search('.comhead > a:first-child').map { |element| element.inner_text}
comment_times = doc.search('.comhead > a:nth-child(2)').map { |element| element.inner_text}
comment_text = doc.search('.comment > font').map { |element| element.inner_text}

   
norwedgian = Post.new(title, linked_url, points, item_id, parsed_doc, usernames, comment_times, comment_text)

binding.pry
norwedgian.add_comment
norwedgian.comments

