require 'pry'

class Post
  attr_reader :title, :linked_url, :points, :item_id, :url_to_scrape
  
  def initialize(title, linked_url, points, item_id, parsed_doc, usernames = nil, comment_text = nil, comment_times = nil)
    @title = title
    @linked_url = linked_url
    @points = points
    @item_id = item_id
    @doc = parsed_doc
    @usernames = usernames
    @comment_text = comment_text
    @comment_times = comment_times
    comments_to_obj
  end



  def comments
    Comment.array_of_comments.each do |comment_obj|
      puts "\n\n #{comment_obj.text}"
    end
  end

  def comments_to_obj
    arr_usernames =  @doc.search('.comhead > a:first-child').map { |element| element.inner_text}
    arr_of_text = @doc.search('.comment > font').map { |element| element.inner_text}
    arr_of_times = @doc.search('.comhead > a:nth-child(2)').map { |element| element.inner_text}
    
    i = 0
    while i < arr_of_text.length
      Comment.new arr_usernames[i], arr_of_times[i], arr_of_text[i]
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

