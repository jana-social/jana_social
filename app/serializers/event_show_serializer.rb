class EventShowSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :street_address, :private_status, :zipcode, :user_id

  attribute :date_time do |object|
    object.date_time.strftime('%Y-%m-%d %H:%M:%S')
  end

  attribute :host do |object|
    user = User.find(object.user_id)
    user.username
  end
end