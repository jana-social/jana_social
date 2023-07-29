class FriendshipSerializer
  include JSONAPI::Serializer
  attributes :id, :user_id, :friend_id, :status
end