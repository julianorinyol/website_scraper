
class Comment
  attr_reader :text, :time, :username
  attr_accessor :array_of_comments
  @@array_of_comments = []
   def initialize username = nil, time = nil, text
    @username = username
    @time = time
    @text = text
    # @@array_of_comments << Comment.new("hey")
    @@array_of_comments << self
    # binding.pry
    # @sub_comment_array = sub_comment_array
  end
 
  def self.array_of_comments
    puts "hey"
    @@array_of_comments
  end

  def self.array_of_commentsaa new_comment
    
    @@array_of_comments << new_comment
  end


end

