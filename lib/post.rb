require 'pry'

class Post
  attr_reader :title, :linked_url, :points, :item_id, :url_to_scrape
  @@array_of_comments = []
  def initialize(url_to_scrape)
    doc = Nokogiri::HTML(File.open(url_to_scrape))

    @title = doc.search('.title > a').map { |link| link.inner_text}
    @linked_url = doc.search('.title > a').map { |link| link['href']}
    @points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}
    @item_id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
    @doc = url_to_scrape 
  end


  def comments
    arr_usernames =  @doc.search('.comhead > a:first-child').map { |element| element.inner_text}
    arr_of_text = @doc.search('.comment > font').map { |element| element.inner_text}
    arr_of_times = @doc.search('.comhead > a:nth-child(2)').map { |element| element.inner_text}


    i = 0
    while i < arr_of_text.length
      Comment.new arr_usernames[i], arr_of_times[i], arr_of_text[i]
      i += 1 
    end

    return @@array_of_comments
  end

  def add_comment(comment_obj)
    #takes a comment object as its input and adds it to the comment list

  end
end
