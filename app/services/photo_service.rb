class PhotoService
  def conn
    Faraday.new(url: "https://api.unsplash.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def random_photo
    get_url("/photos/random/?client_id=#{ENV['UNSPLASH_KEY']}")
  end
end
