class Photo
  attr_reader :url

  def initialize(data)
    @url = data[:url]
  end
end