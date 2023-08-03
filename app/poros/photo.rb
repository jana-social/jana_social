class Photo
  attr_reader :url

  def initialize(data)
    @url = data[:urls][:thumb]
  end
end
