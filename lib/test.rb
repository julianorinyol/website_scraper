require 'nokogiri'
# require_relative '../post.html'
require 'pp'
require 'pry'
doc = Nokogiri::HTML(File.open('/home/julian/Documents/Lighthouse/w2/d3/scraper/post.html'))



# rich_norwedgian_man = Post.new 'https://news.ycombinator.com/item?id=9182368'


# def extract_usernames(doc)
#   doc.search('.comhead > a:first-child').map do |element|
#     element.inner_text
#   end
# end

# returns the number of points the post has
# pp doc.search('.subtext > span:first-child').map { |span| span.inner_text}

# returns the posts item id
# pp doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }

# returns an array containing the title of the post
# pp doc.search('.title > a').map { |link| link.inner_text}

# returns the href link for the linked content
# pp doc.search('.title > a').map { |link| link['href']}

# returns all comment text, including sub comments.
# pp doc.search('.comment > font:first-child').map { |font| font.inner_text}

# returns list of all users who commented on the posts
  # pp doc.search('.comhead > a:first-child').map { |element| element.inner_text}

  # returns all comment text, including sub comments.
# pp doc.search('.default').map { |font| font.inner_text}


  # iterate through all of the comments 
  

x = 0
# for user name
arr_usernames =  doc.search('.comhead > a:first-child').map { |element| element.inner_text}
arr_of_text = doc.search('.comment > font').map { |element| element.inner_text}
arr_of_times = doc.search('.comhead > a:nth-child(2)').map { |element| element.inner_text}
# doc.search('.comhead > a:first-child').map { |element| element.inner_text}

# for text
class Comment
  @@comment_array = []
  attr_reader :text
  def initialize username = nil, time = nil, text
    @username = username
    @time = time
    @text = text
    @@comment_array << self
  end
  def self.comment_array
    @@comment_array
  end
end

i = 0
while i < arr_of_text.length
  Comment.new arr_usernames[x], arr_of_times[x], arr_of_text[x]
  i += 1 
end


bla = Comment.new "heyheyhey"
p bla.text

# p Comment.comment_array


# Comment.comment_array.each do |comment_obj|
#       puts comment_obj.text
#       # puts "\n\n #{comment_obj.text}"
# end