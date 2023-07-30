def user_data
  user_1_location = File.read("./spec/fixtures/manual_data/user_data/user_1.json")
  user_2_location = File.read("./spec/fixtures/manual_data/user_data/user_2.json")
  user_3_location = File.read("./spec/fixtures/manual_data/user_data/user_3.json")
  user_4_location = File.read("./spec/fixtures/manual_data/user_data/user_4.json")

  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=505%20E%20Colfax%20Ave,%2080203,%20United%20States")
    .to_return(status: 200, body: user_1_location)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=1800%2028th%20St,%2080301,%20United%20States")
    .to_return(status: 200, body: user_2_location)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=990%20Summit%20Blvd,%2092315,%20United%20States")
    .to_return(status: 200, body: user_3_location)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=90210,%20United%20States")
    .to_return(status: 200, body: user_4_location)

  # Complete user data
  @user1 = User.create!(
    username: "Foo",
    zipcode: "80203",
    street_address: "505 E Colfax Ave",
    email: "foo@gmail.com",
    password_digest: "test123"
  )
  # Complete user data
  @user2 = User.create!(
    username: "Barr",
    zipcode: "80301",
    street_address: "1800 28th St",
    email: "barr@gmail.com",
    password_digest: "password321"
  )
  # Complete user data
  @user3 = User.create!(
    username: "Mr. Test",
    zipcode: "92315",
    street_address: "990 Summit Blvd",
    email: "test@gmail.com",
    password_digest: "secret123"
  )
  # Missing street address
  @user4 = User.create!(
    username: "Tupac Shakur",
    zipcode: "90210",
    email: "tupac@aol.com",
    password_digest: "all_eyez_on_me"
  )
end

def event_data
  event_1_location = File.read("./spec/fixtures/manual_data/event_data/event_1.json")
  event_4_location = File.read("./spec/fixtures/manual_data/event_data/event_4.json")

  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=990%20Summit%20Blvd,%2092315,%20United%20States")
    .to_return(status: 200, body: event_1_location)

  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=93109,%20United%20States")
    .to_return(status: 200, body: event_4_location)

  @event1 = Event.create!(
    title: "Ski Trip",
    street_address: "990 Summit Blvd",
    zipcode: "92315",
    user_id: @user3.id
  )
  @event4 = Event.create!(
    title: "Beach Trip",
    zipcode: "93109",
    user_id: @user3.id
  )
end
