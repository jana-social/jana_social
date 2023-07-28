class EventIndexSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :street_address, :date_time, :private_status, :zipcode
end
