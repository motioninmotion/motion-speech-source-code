class Reading
  attr_reader :title, :content

  def initialize(title, content)
    @title, @content = title, content
  end

  def to_speakable
    title + ". " + content
  end
end
