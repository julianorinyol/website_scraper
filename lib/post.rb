require 'pry'

class Post
  attr_reader :title, :linked_url, :points, :item_id, :url_to_scrape
  
  def initialize(title, linked_url, points, item_id, parsed_doc, usernames, comment_times, comment_text)
    @title = title
    @linked_url = linked_url
    @points = points
    @item_id = item_id
    @doc = parsed_doc
    @usernames = usernames
    @comment_text = comment_text
    @comment_times = comment_times
    comments_to_obj(usernames,comment_times, comment_text)
  end



  def comments
    # binding.pry
    Comment.array_of_comments.each do |comment_obj|
      puts "\n\n #{comment_obj.text}"
    end
  end

  def comments_to_obj(usernames, comment_times, comment_text)
    
    i = 0
    while i < usernames.length
      Comment.new usernames[i], comment_times[i], comment_text[i]
      i += 1 
    end
  end


  def add_comment
    #takes a comment object as its input and adds it to the comment list

    puts "\n\nwhat is your comment?"

    user_response = STDIN.gets.chomp
    a = Comment.new user_response
  end
end

