
class Comment

  @@array_of_comments
   def initialize username, time, text
    @username = username
    @time = time
    @text = text
    @@array_of_comments << self
    # @sub_comment_array = sub_comment_array
  end
 
  def self.comment_array_return
    @@comments
  end

end

