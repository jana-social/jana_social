class UserCreateSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :password_digest, :zipcode, :street_address, :bio, :likes, :dislikes, :profile_image_link, :latitude, :longitude
end
