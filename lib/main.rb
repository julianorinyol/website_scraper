require_relative 'post.rb'
require_relative 'comment.rb'
# require_relative 'post.html'
# require 'active_support/all'
require 'nokogiri'
require 'pry'




norwedgian = Post.new '/home/julian/Documents/Lighthouse/w2/d3/scraper/post.html'



# https://news.ycombinator.com/item?id=9182368


puts norwedgian.title
binding.pry