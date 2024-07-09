class Game
  attr_accessor :title, :platform

  def initialize(title, platform)
    @title = title
    @platform = platform
  end

  def to_s
    "#{@title} for #{@platform}"
  end
end
