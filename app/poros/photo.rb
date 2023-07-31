class Photo
  attr_reader :url

  def initialize(data)
    @url = data[:urls][:raw]
  end
end