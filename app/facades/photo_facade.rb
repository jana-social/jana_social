class PhotoFacade
  def get_photo
    service = PhotoService.new
    request = service.random_photo
    Photo.new(request)
  end
end
