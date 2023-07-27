class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :passord_digest, :zipcode, :street_address, :bio, :likes, :dislikes, :profile_image_link, :latitude, :longitude
end
