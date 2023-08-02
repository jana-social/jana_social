class EventUserSerializer
  include JSONAPI::Serializer
  attribute :event_title do |object|
    object.event.title
  end

  attribute :username do |object|
    object.user.username
  end
end
