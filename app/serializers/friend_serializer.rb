class FriendSerializer
  include JSONAPI::Serializer
  attributes :username, :bio, :likes, :dislikes, :profile_image_link
end
