require_relative 'post.rb'
require_relative 'comment.rb'
# require_relative 'post.html'
require 'active_support/all'
require 'nokogiri'
require 'pry'
require 'rubygems'
require 'open-uri'

# url_to_scrape = '/home/julian/Documents/Lighthouse/w2/d3/scraper/post.html'
url_to_scrape = ARGV[0]
# url_to_scrape = "https://news.ycombinator.com/item?id=9185526"


doc = Nokogiri::HTML(open(url_to_scrape))
# doc = Nokogiri::HTML(open("https://news.ycombinator.com/item?id=9185526"))


 title = doc.search('.title > a').map { |link| link.inner_text}
 linked_url = doc.search('.title > a').map { |link| link['href']}
 points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}
 item_id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
 parsed_doc = doc

usernames =  doc.search('.comhead > a:first-child').map { |element| element.inner_text}
comment_times = doc.search('.comhead > a:nth-child(2)').map { |element| element.inner_text}
comment_text = doc.search('.comment > font').map { |element| element.inner_text}


new_post = Post.new(title, linked_url, points, item_id, parsed_doc, usernames, comment_times, comment_text)

# binding.pry

puts "type 'comments' or 'add_comment'"
user_input = STDIN.gets.chomp
case user_input
  when 'comments'
    new_post.comments
  when 'add_comment'
    new_post.add_comment
    new_post.comments
  else
    puts "type 'comments' or 'add_comment'"
    user_input = STDIN.gets.chomp
end



