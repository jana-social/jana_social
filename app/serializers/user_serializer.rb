class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :zipcode, :street_address, :bio, :likes, :dislikes, :profile_image_link, :latitude, :longitude
end
