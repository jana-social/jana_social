def validation_data
  valid_five_digit_zip = File.read("./spec/fixtures/manual_data/validation_data/valid_five_digit_zip.json")
  valid_zip_plus_four = File.read("./spec/fixtures/manual_data/validation_data/valid_zip_plus_four.json")
  four_digit_zip = File.read("./spec/fixtures/manual_data/validation_data/four_digit_zip.json")
  letters_in_zip = File.read("./spec/fixtures/manual_data/validation_data/letters_in_zip.json")
  bad_street_address = File.read("./spec/fixtures/manual_data/validation_data/bad_street_address.json")

  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=80203,%20United%20States")
    .to_return(status: 200, body: valid_five_digit_zip)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=80203-0121,%20United%20States")
    .to_return(status: 200, body: valid_zip_plus_four)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=8020,%20United%20States")
    .to_return(status: 200, body: four_digit_zip)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=ABC12,%20United%20States")
    .to_return(status: 200, body: letters_in_zip)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=324%20Blickford%20Drive,%2032492,%20United%20States")
    .to_return(status: 200, body: bad_street_address)

  user_photo = File.read("./spec/fixtures/manual_data/user_data/user_profile_photo.json")

  stub_request(:get, "https://api.unsplash.com/photos/random/?client_id=KXGPdzW7pghAeWUVP5oxhZcLCiDad1VPN_tBNIC8p80")
    .to_return(status: 200, body: user_photo)
end

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

  user_photo = File.read("./spec/fixtures/manual_data/user_data/user_profile_photo.json")
    stub_request(:get, "https://api.unsplash.com/photos/random/?client_id=KXGPdzW7pghAeWUVP5oxhZcLCiDad1VPN_tBNIC8p80")
    .to_return(status: 200, body: user_photo)

  # Complete user data
  @user1 = User.create!(
    username: "Foo",
    zipcode: "80203",
    street_address: "505 E Colfax Ave",
    email: "foo@gmail.com",
    password: "test123"
  )
  # Complete user data
  @user2 = User.create!(
    username: "Barr",
    zipcode: "80301",
    street_address: "1800 28th St",
    email: "barr@gmail.com",
    password: "password321"
  )
  # Complete user data
  @user3 = User.create!(
    username: "Mr. Test",
    zipcode: "92315",
    street_address: "990 Summit Blvd",
    email: "test@gmail.com",
    password: "secret123"
  )
  # Missing street address
  @user4 = User.create!(
    username: "Tupac Shakur",
    zipcode: "90210",
    email: "tupac@aol.com",
    password: "all_eyez_on_me"
  )
end

def event_data
  event_1_location = File.read("./spec/fixtures/manual_data/event_data/event_1.json")
  event_2_location = File.read("./spec/fixtures/manual_data/event_data/event_2.json")
  event_3_location = File.read("./spec/fixtures/manual_data/event_data/event_3.json")
  event_4_location = File.read("./spec/fixtures/manual_data/event_data/event_4.json")

  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=990%20Summit%20Blvd,%2092315,%20United%20States")
    .to_return(status: 200, body: event_1_location)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=650%20S%20Camino%20Del%20Rio,%2081301,%20United%20States")
    .to_return(status: 200, body: event_2_location)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=2100%20E%20Iowa%20Ave,%2080210,%20United%20States")
    .to_return(status: 200, body: event_3_location)
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=93109,%20United%20States")
    .to_return(status: 200, body: event_4_location)

  # Complete event data
  @event1 = Event.create!(
    title: "Ski Trip",
    street_address: "990 Summit Blvd",
    description: "Lorem Ipsum",
    zipcode: "92315",
    date_time: "2023-10-5 4:30:00",
    private_status: false,
    user_id: @user1.id
  )
  # Complete event data
  @event2 = Event.create!(
    title: "BBQ",
    street_address: "650 S Camino Del Rio",
    description: "Lorem Ipsum",
    zipcode: "81301",
    date_time: "2023-10-5 4:30:00",
    private_status: false,
    user_id: @user2.id
  )
  # Complete event data
  @event3 = Event.create!(
    title: "Hike",
    street_address: "2100 E Iowa Ave",
    description: "Lorem Ipsum",
    zipcode: "80210",
    date_time: "2023-10-5 4:30:00",
    private_status: false,
    user_id: @user2.id
  )
  # Missing street address
  @event4 = Event.create!(
    title: "Beach Trip",
    description: "Lorem Ipsum",
    zipcode: "93109",
    date_time: "2023-10-5 4:30:00",
    private_status: false,
    user_id: @user1.id
  )
end

def user_params_data
  @new_user = {
    username: Faker::Dessert.variety,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    zipcode: "80203"#,
    ## Could figure out order of operations for geocoding by zip and address, call on line 144 not working with
    ## commented code below commented in
    # street_address: "505 E Colfax Ave",
    # bio: Faker::Hipster.sentences(number: 5),
    # likes: Faker::Hipster.sentence,
    # dislikes: Faker::Hipster.sentence,
    # profile_image_link: "http://random.org/example"
  }

  user_1_location = File.read("./spec/fixtures/manual_data/user_data/user_1.json")

  # stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=505%20E%20Colfax%20Ave,%2080203,%20United%20States")
  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=80203,%20United%20States")
    .to_return(status: 200, body: user_1_location)

  user_photo = File.read("./spec/fixtures/manual_data/user_data/user_profile_photo.json")
    stub_request(:get, "https://api.unsplash.com/photos/random/?client_id=KXGPdzW7pghAeWUVP5oxhZcLCiDad1VPN_tBNIC8p80")
    .to_return(status: 200, body: user_photo)
end

def event_params
  @new_event = {
    title: "Event 20",
    description: "Kings Head British Pub",
    street_address: "6460 US-1, St. Augustine, FL",
    zipcode: "32095",
    date_time: "2023-10-5 4:30:00",
    private_status: false,
    user_id: @user1.id
  }

  event_1_location = File.read("./spec/fixtures/manual_data/event_params/new_event.json")

  stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=6460%20US-1,%20St.%20Augustine,%20FL,%2032095,%20United%20States")
    .to_return(status: 200, body: event_1_location)
end
