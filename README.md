<h1> Jana Social </h1>

[Render deployment for BE](https://jana-social-be.onrender.com) <br>
[Render deployment for FE](https://jana-social-fe.onrender.com/) <br>
[DB schema](https://dbdiagram.io/d/645986badca9fb07c4b9e033) <br>
[Full team Miro board](https://miro.com/app/board/uXjVMz_g040=/) <br>
[Users team Miro board](https://miro.com/app/board/uXjVMz5BkDM=/) <br>
[Events team Miro board](https://miro.com/app/board/uXjVMz4nZmc=/)


<h2> Teams </h2>

<h3> Users Team </h3>

 - Lauren Golden: [GitHub](https://github.com/goldenll) | [LinkedIn](https://www.linkedin.com/in/goldenll/)
 - Alex Kiselich: [GitHub](https://github.com/AlexKiselich) | [LinkedIn](https://www.linkedin.com/in/alexanderkiselich/)
 - Garrett Gregor: [GitHub](https://github.com/garrettgregor) | [LinkedIn](https://www.linkedin.com/in/garrett-gregor/)
 - Andy Weissman: [GitHub](https://github.com/andyweissman6) | [LinkedIn](https://www.linkedin.com/in/andy-weissman/)

<h3> Events Team </h3>

 - Jeff Nelson: [GitHub](https://github.com/jpnelson85) | [LinkedIn](https://www.linkedin.com/in/jeff-nelson-307aba45/)
 - Sarah Garlock: [GitHub](https://github.com/sarahgarlock) | [LinkedIn](https://www.linkedin.com/in/sarah-garlock-795855195/)
 - Jesse Thomas: [GitHub](https://github.com/jgthomas-12) | [LinkedIn](https://www.linkedin.com/in/jesse-g-thomas/)
 - Austin Woods: [GitHub](https://github.com/boomclear) | [LinkedIn](https://www.linkedin.com/in/austin-woods-1830aa195/)

<h3> Location/Friends Team </h3>

 - Myles Nottingham: [GitHub](https://github.com/MylesNottingham) | [LinkedIn](https://www.linkedin.com/in/mylesnottingham/)
 - Blaine Glasgow: [GitHub](https://github.com/GlowMunch) | [LinkedIn](https://www.linkedin.com/in/blaine-glasgow-134a9017a/)
 - Amy Spears: [GitHub](https://github.com/Amspears007) | [LinkedIn](https://www.linkedin.com/in/amy-marie-spears-900997105/)
 - Steven Stackhouse: [GitHub](https://github.com/stackmm) | [LinkedIn](https://www.linkedin.com/in/steven-stackhouse/)

 ---

  <h3> How to install the project?</h3>

- Fork and clone this repo
- Run `bundle install`
- Run `rails db:{create,migrate,seed}`
- User will need to sign up for a unsplash api key and create account [here](https://unsplash.com/documentation#creating-a-developer-account)
- `bundle exec rspec` to run the test suite

---

# API JSON CONTRACT

Description of API endpoints for front end application

## Users

Description of users endpoints

### GETting users

`GET /api/v1/users`

Success Response (200 OK):

- Status: 200 OK
- Description: Successful response with list of users.
- Data Format: An array of user hashes, each containing "id", "type" and "attributes".

```json
Status: 200 OK

{
  "data": [
      {
        "id": "1",
        "type": "user",
        "attributes": {
          "username": "Sweet Bread",
          "email": "stefanie@jaskolski-sanford.example",
          "zipcode": "01417",
          "street_address": "13575 Lavonda Ways",
          "bio": "[\"Five dollar toast sriracha pop-up.\", \"Williamsburg austin mustache kombucha literally ennui pabst.\", \"Umami post-ironic direct trade.\", \"Sustainable diy park seitan pop-up selvage farm-to-table cold-pressed.\", \"Roof yolo blog.\"]",
          "likes": "Gentrify roof hoodie mlkshk skateboard.",
          "dislikes": "Lo-fi irony you probably haven't heard of them fingerstache tofu.",
          "profile_image_link": "https://unsplash.com/photos/CNegXS-nQRU",
          "latitude": 9.191590386771395,
          "longitude": -29.227836572765966
        }
      },
    {
      "id": "2",
      "type": "user",
      "attributes": {
        "username": "Doughnut",
        "email": "carlton.padberg@bogisich.example",
        "zipcode": "24601-5905",
        "street_address": "9747 Agripina Mews",
        "bio": "[\"Freegan diy fanny pack.\", \"Ethical slow-carb photo booth cardigan.\", \"Seitan williamsburg viral deep v tattooed.\", \"Waistcoat wolf ramps church-key.\", \"Roof cleanse chia pop-up wes anderson.\"]",
        "likes": "Tattooed hammock street keytar.",
        "dislikes": "Muggle magic everyday selfies humblebrag messenger bag organic listicle swag.",
        "profile_image_link": "https://unsplash.com/photos/eci9mjEShIs",
        "latitude": -34.157539767042294,
        "longitude": -23.89193962132606
      }
    },
    {
      "id": "3",
      "type": "user",
      "attributes": {
        "username": "Sundae",
        "email": "nicholle_stroman@feeney-mraz.test",
        "zipcode": "42472-6277",
        "street_address": "93085 Thompson Ramp",
        "bio": "[\"Distillery cardigan ennui fanny pack ethical tilde taxidermy yr.\", \"Plaid franzen iphone cred.\", \"Squid gentrify wayfarers ethical austin.\", \"Cliche migas kinfolk try-hard hoodie.\", \"Fashion axe helvetica yuccie.\"]",
        "likes": "Plaid fashion axe swag carry.",
        "dislikes": "Kinfolk umami pitchfork biodiesel deep v.",
        "profile_image_link": "https://unsplash.com/photos/z_eoi3ppf5U",
        "latitude": 56.575376118625,
        "longitude": -131.71707083834286
      }
    },
    {
    "id": "4",
    "type": "user",
    "attributes": {
      "username": "Cheesecake",
      "email": "clarence.ullrich@bailey.test",
      "zipcode": "68339-1504",
      "street_address": "85203 Janett Fork",
      "bio": "[\"Iphone pickled diy.\", \"Food truck put a bird on it distillery readymade chartreuse meh meditation.\", \"Cliche master mlkshk occupy ramps vice narwhal church-key.\", \"Keffiyeh mixtape tousled.\", \"Forage typewriter shabby chic gentrify.\"]",
      "likes": "Stumptown skateboard aesthetic green juice.",
      "dislikes": "Migas sriracha green juice yolo jean shorts narwhal muggle magic ramps kickstarter.",
      "profile_image_link": "https://unsplash.com/photos/Fm5VRMqvy4M",
      "latitude": -82.1685670150713,
      "longitude": 50.33235642661597
      }
    },
    {
      "id": "5",
      "type": "user",
      "attributes": {
        "username": "Cake Pop",
        "email": "jeremiah@grimes.example",
        "zipcode": "79859-1323",
        "street_address": "1744 Arden Walk",
        "bio": "[\"Vice leggings post-ironic kombucha organic cronut try-hard master.\", \"Typewriter tilde gentrify meditation.\", \"Cronut master intelligentsia.\", \"Park listicle photo booth trust fund craft beer dreamcatcher seitan.\", \"Chia kombucha craft beer green juice umami tousled flexitarian.\"]",
        "likes": "Mixtape 90's muggle magic selfies godard asymmetrical fashion axe schlitz.",
        "dislikes": "Williamsburg authentic helvetica polaroid blue bottle waistcoat brooklyn five dollar toast.",
        "profile_image_link": "https://unsplash.com/photos/TZFshUFzWRQ",
        "latitude": 13.284941256302815,
        "longitude": -117.97901844759286
      }
    }
  ]
}
```

`GET /api/v1/users/1`

Success Response (200 OK):

- Status: 200 OK
- Description: Successful response with a specific user for a specific user id.
- Data Format: A data hash, with keys "id", "type" and "attributes".

```json
GET /api/v1/users/1 HTTP/1.1
Content-Type: application/vnd.api+json
Accept: application/vnd.api+json

{
  "data":
  {
    "id": "1",
    "type": "user",
    "attributes": {
      "username": "Sweet Bread",
      "email": "stefanie@jaskolski-sanford.example",
      "zipcode": "01417",
      "street_address": "13575 Lavonda Ways",
      "bio": "[\"Five dollar toast sriracha pop-up.\", \"Williamsburg austin mustache kombucha literally ennui pabst.\", \"Umami post-ironic direct trade.\", \"Sustainable diy park seitan pop-up selvage farm-to-table cold-pressed.\", \"Roof yolo blog.\"]",
      "likes": "Gentrify roof hoodie mlkshk skateboard.",
      "dislikes": "Lo-fi irony you probably haven't heard of them fingerstache tofu.",
      "profile_image_link": "https://unsplash.com/photos/CNegXS-nQRU",
      "latitude": 9.191590386771395,
      "longitude": -29.227836572765966
    }
  }
}
```

Error Response (404 Not Found):

- Status: 404 Not Found
- Description: The requested user was not found.
- Data Format: Error message for human.

```json
Status: 404 Not Found

{
  "error":
  {
    "code": "not_found",
    "message": "The requested user was not found."
  }
}
```
#### Note on Authenticating Users
Current method searches by email and passes password as params, this will be refactored in a later update.

### Creating Users

`POST /api/v1/users`

Client needs to supply the following attributes:

```json
POST /api/v1/users HTTP/1.1
Content-Type: application/vnd.api+json
Accept: application/vnd.api+json

{
  "username":"schroederJerde",
  "email":"schroederJerde@gmail.com",
  "zipcode":"80301"
}
```

Success Response (201 Created):

- Status: 201 Created
- Description: Successful response with a specific user for a specific user id.
- Data Format: A data hash, with keys "id", "type" and "attributes".
- Location: http://localhost:3000/api/v1/users/1

```json
HTTP/1.1 201 Created
Location: http://example.com/photos/550e8400-e29b-41d4-a716-446655440000
Content-Type: application/vnd.api+json

{
  "data":
  {
    "type": "user",
    "id": "1",
    "attributes":
    {
      "username":"schroederJerde",
      "email":"schroederJerde@gmail.com",
      "zipcode":"80301"
    }
  }
}
```

### Updating Users

`PATCH /api/v1/users/{user_id}`

Client may supply any of the following attributes:

```json
POST /api/v1/users/1 HTTP/1.1
Content-Type: application/vnd.api+json
Accept: application/vnd.api+json

{
  "zipcode":"80301",
  "street_address":"123 Main Street, New York, NY",
  "bio":"Lorem ipsum dolor sit amet",
  "likes":"consectetur adipiscing elit",
  "dislikes":"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
  "latitude":"40.712776",
  "longitude":"-74.005974"
}
```
Success Response (202 Accepted):

- Status: 202 Accepted
- Description: Successful response with a specific user for a specific user id.
- Data Format: A data hash, with keys "id", "type" and "attributes".
- Location: http://localhost:3000/api/v1/users/1

```json
HTTP/1.1 202 Accepted
Location: http://localhost:3000/api/v1/users/1
Content-Type: application/vnd.api+json

{
  "data":
  {
    "type": "user",
    "id": "1",
    "attributes":
    {
      "username":"schroederJerde",
      "email":"schroederJerde@gmail.com",
      "zipcode":"80301",
      "zipcode":"80301",
      "street_address":"123 Main Street, New York, NY",
      "bio":"Lorem ipsum dolor sit amet",
      "likes":"consectetur adipiscing elit",
      "dislikes":"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
      "latitude":"40.712776",
      "longitude":"-74.005974"
    }
  }
}
```

## User Events

### Getting Hosted Events

GET "/api/v1/users/:id/events/hosting"

This endpoint will get all of the events a user is hosting.

Success Response (200 OK):
  - Status: 200 OK
  - Description: Successful response with list of events a specific user is hosting.
  - Data Format: An array of event objects, each containing "id", "type", and "attributes".

```json
Status: 200 OK

{
  "data": [
    {
      "id": "1",
      "type": "event_show",
      "attributes": {
        "title": "Casey's Sweet Quiet Gathering",
        "description": "Movie for people with noise senesitivities",
        "street_address": "5479 William Way, East Sonnyhaven, LA",
        "zipcode": "63637",
        "date_time": "8-17-23, 5:25 PM",
        "private": true,
        "host": "Percival Mangst",
        "user_id": 134
      }
    },
     {
      "id": "2",
      "type": "event_show",
      "attributes": {
        "title": "Percy's Wild Journey",
        "description": "This is a movie full of metal. Like Iron and Cobalt, even Tin",
        "street_address": "5479 William Way, Sonnyhaven, LA",
        "zipcode": "84674",
        "date_time": "10-1-23, 6:00 PM",
        "private": false,
        "host": "Percival Mangst",
        "user_id": 134
      }
    }
  ]
}
```

Error Response (404 Not Found):
  - Status: 404 Not Found
  - Description: The requested user was not found.
  - Data Format: Error message for human.

```json
Status: 404 Not Found

{
  "error": {
    "code": "not_found",
    "message": "The requested user was not found."
  }
}
```
### Getting 'Attending' Events


GET "/api/v1/users/:id/events/attending"

This endpoint will get all of the events a user is attending.

Success Response (200 OK):
  - Status: 200 OK
  - Description: Successful response with list of events a specific user is attending.
  - Data Format: An array of event objects, each containing "id", "type", and "attributes".

```json
Status: 200 OK

{
  "data": [
    {
      "id": "1",
      "type": "event_show",
      "attributes": {
        "title": "Casey's Sweet Quiet Gathering",
        "description": "Movie for people with noise senesitivities",
        "street_address": "5479 William Way, East Sonnyhaven, LA",
        "zipcode": "63637",
        "date_time": "8-17-23, 5:25 PM",
        "private": true,
        "host": "Isabelle Stuart",
        "user_id": 186
      }
    },
     {
      "id": "2",
      "type": "event_show",
      "attributes": {
        "title": "Movie Title",
        "description": "A movie is about soft metals, like Sodium, Potassium and Silvah",
        "street_address": "5479 William Way, Sonnyhaven, CO",
        "zipcode": "84674",
        "date_time": "10-1-23, 6:00 PM",
        "private": false,
        "host": "Joey Jospeh Mariella",
        "user_id": 17
      }
    }
  ]
}
```

Error Response (404 Not Found):
  - Status: 404 Not Found
  - Description: The requested user was not found.
  - Data Format: Error message for human.

```json
Status: 404 Not Found

{
  "error": {
    "code": "not_found",
    "message": "The requested user was not found."
  }
}
```

## Events

### Getting Events

GET "/api/v1/events"

This endpoint will get a list of all events.

Success Response (200 OK):
  - Status: 200 OK
  - Description: Successful response with list of events.
  - Data Format: An array of event objects, each containing "id", "type", and "attributes".

```json
Status: 200 OK

{
  "data": [
    {
      "id": "1",
      "type": "event_index",
      "attributes": {
        "title": "Casey's Sweet Quiet Gathering",
        "description": "Movie for people with noise senesitivities",
        "street_address": "5479 William Way, East Sonnyhaven, LA",
        "zipcode": "63637",
        "date_time": "8-17-23, 5:25 PM",
        "private": true,
        "host": 1
      }
    },
     {
      "id": "2",
      "type": "event_index",
      "attributes": {
        "title": "Movie Title",
        "description": "This is a movie ",
        "street_address": "5479 William Way, Sonnyhaven, CO",
        "zipcode": "84674",
        "date_time": "10-1-23, 6:00 PM",
        "private": false,
        "host": 6
      }
    }
  ]
}
```

Error Response (404 Not Found):
  - Status: 404 Not Found
  - Description: The requested event was not found.
  - Data Format: Error message for human.

```json
Status: 404 Not Found

{
  "error": {
    "code": "not-found",
    "message": "The requested event was not found."
  }
}
```

GET "/api/v1/events/:id"

This endpoint will get one event.

Success Response (200 OK):
  - Status: 200 OK
  - Description: Successful response with one event.
  - Data Format: An object representing the event with "id", "type", and "attributes".

```json
Status: 200 OK

{
  "id": "1",
  "type": "event_show",
  "attributes": {
    "title": "Casey's Sweet Quiet Gathering",
    "description": "Movie for people with noise senesitivities",
    "street_address": "5479 William Way, East Sonnyhaven, LA",
    "zipcode": "63637",
    "date_time": "8-17-23, 5:25 PM",
    "private": true,
    "host": 1
  }
}
```

Error Response (404 Not Found):
  - Status: 404 Not Found
  - Description: The requested event was not found.
  - Data Format: Error message for human.

```json
Status: 404 Not Found

{
  "error": {
    "code": "not_found",
    "message": "The requested event was not found."
  }
}
```

GET "/api/v1/events/:id/event_users"

This endpoint will get all of one events users/attendees.

Success Response (200 OK):
  - Status: 200 OK
  - Description: Successful response with list of users belonging to specific event.
  - Data Format: An array of user objects, each containing "user_id", "event_id", and "status".

```json
Status: 200 OK

{
  "data": [
    {
      "event_title": "Casey's Baseball Funtime",
      "user_name": "James",
      // "status": "accepted",
    },
    {
      "event_title": "Casey's Baseball Funtime",
      "user_name": "Corey",
      // "status": "accepted",
    },
    {
      "event_title": "Casey's Baseball Funtime",
      "user_name": "Staci",
      // "status": "pending",
    },
    {
      "event_title": "Casey's Baseball Funtime",
      "user_name": "Anderson",
      // "status": "denied",
    }
  ]
}
```
### Creating Events

POST "/api/v1/users/:id/events"

This endpoint will allow a user to create an event.

OAuth GET point.

Success Response: (201 Created):
  - Status: 201 Created
  - Description: An event is successfully created.
  - Data Format: The created event object, containing "id", "type", and "attributes".

```json
Status: 201 Created

{
  "data": {
    "id": "12",
    "type": "event",
    "attributes": {
      "title": "A New Event",
      "description": "A new activity",
      "street_address": "5479 William Way, East Sonnyhaven, LA",
      "zipcode": "63637",
      "date_time": "8-17-23, 5:25 PM",
      "private": true,
      "host": 1
    }
  }
}
```

Error Response (400 Bad Request):
  - Status: 400 Bad Request
  - Description: The request could not be understood or was missing parameters.
  - Data Format: Error message for human.

```json
Status: 400 Bad Request

{
  "error": {
    "message": "Invalid parameters."
  }
}
```

### Updating Events

PATCH "/api/v1/users/:id/events/:id"

This endpoint will allow a user to update their event.

OAuth return point.

```json
Status: 200 OK

{
  "id": "1",
  "type": "event",
  "attributes": {
    "title": "Updated Gathering",
    "description": "Updated Movie",
    "street_address": "5479 William Way, East Sonnyhaven, LA",
    "zipcode": "63637",
    "date_time": "8-17-23, 5:25 PM",
    "private": true,
    "host": 1
  }
}
```

Error Response (400 Bad Request):
  - Status: 400 Bad Request
  - Description: The request could not be understood or was missing parameters.
  - Data Format: Error message for human.

```json
Status: 400 Bad Request

{
  "error": {
    "message": "Invalid parameters. Request to update event is not valid."
  }
}
```

### Deleting Events

DELETE "/api/v1/users/:id/events/:id"

This endpoint will allow a user to delete their event.

OAuth return point.

response for successful deletion:

```json
Status: 200 OK

{
"message":"Event successfully deleted"
}
```

response for failed deletion:

```json
Status: 404 Not Found -->

{
"error":"Event not found. The event does not exist or has already been deleted."
}
```
## Locations

GET "/api/v1/users/find_all?distance=#{distance}"

This endpoint will return all users within the specific distance input radius

 - Status: 200 OK
  - Description: Successful response with list of users where zipcode/address resides within radius of the distance typed in by the user typed in Returns users based on search distance.
  - Data Format: An array of user hash objects with keys "id", "type" and "attributes".

```JSON
  Status: 200 OK

{
  "data": [
    {
      "id": "1",
      "type": "user",
      "attributes": {
        "username": "amyisfun",
        "email": "am123@gmail.com",
        "zipcode": "63637",
        "bio": "Caretaker for 43 yo sister with learning disabilities",
        "likes": "being outside",
        "dislikes": "loud crowds",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
      }
    },
     {
      "id": "2",
      "type": "user",
      "attributes": {
        "username": "LGisgreat",
        "email": "LG123@gmail.com",
        "zipcode": "63637",
        "bio": "Caretaker for sister in mid thirties with learning disabilities",
        "likes": "quiet activities",
        "dislikes": "lots of people",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
      }
    }
  ]
}

```

Status: 200 OK
  "message": "Search did not return any results please adjust your distance"

```JSON
Status: 404 Not Found

{
  "error": {
    "code": "not_found",
    "message": "Must input a valid number of miles for distance."
  }
}
```

```JSON
Status: 404 Not Found

{
  "error": {
    "code": "not_found",
    "message": "search field cannot be blank."
  }
}
```

GET "/api/v1/events/find_all?distance=#{distance}"
```JSON

- Status: 200 OK
- Description: Successful response with list of events based on search distance.
- Data Format: An array of event objects, each containing "id", "type", and "attributes".

{
  "data": [
    {
      "id": "1",
      "type": "event",
      "attributes": {
        "title": "Casey's Sweet Quiet Gathering",
        "description": "Movie for people with noise senesitivities",
        "street_address": "5479 William Way, East Sonnyhaven, LA",
        "zip_code": "63637",
        "date_time": "8-17-23, 5:25 PM",
        "private": "true",
        "host": "1",
      }
    },
     {
      "id": "2",
      "type": "event",
      "attributes": {
        "title": "Movie Title",
        "description": "This is a movie ",
        "street_address": "5479 William Way, Sonnyhaven, CO",
        "zip_code": "84674",
        "date_time": "10-1-23, 6:00 PM",
        "private": "false",
        "host": "1",
      }
    }
  ]
}
```

GET "/api/v1/user/:id/friendships"
```JSON

- Status: 200 OK
  - Description: Successful response with list of users where Returns a user's friends where both users have approved relationship
  - Data Format: An array of user objects, each containing "user_id" and "status".

   Status: 200 OK

{
  "data": [
    {
      "id": "1",
      "type": "user",
      "attributes": {
        "username": "amyisfun",
        "email": "am123@gmail.com",
        "zip_code": "63637",
        "bio": "Caretaker for 43 yo sister with learning disabilities",
        "likes": "being outside",
        "dislikes": "loud crowds",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
      }
    },
     {
      "id": "2",
      "type": "user",
      "attributes": {
        "username": "LGisgreat",
        "email": "LG123@gmail.com",
        "zip_code": "63637",
        "bio": "Caretaker for sister in mid thirties with learning disabilities",
        "likes": "quiet activities",
        "dislikes": "lots of people",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
      }
    }
  ]
}

```

POST "/api/v1/friendships"

This endpoint will allow a user to create or modify a friendship relationship.

Success Response: (201 Created):
  - Data Format: An array of the two user objects (the first being the person who initiated the request, the second being the person who they approved) which has been converted to json/serialized  It also returns an enum "status" of "pending"

```JSON
 Status: 201 Created

{
  "data": [
    {
      "id": "1",
      "type": "user",
      "attributes": {
        "username": "amyisfun",
        "email": "am123@gmail.com",
        "zipcode": "63637",
        "bio": "Caretaker for 43 yo sister with learning disabilities",
        "likes": "being outside",
        "dislikes": "loud crowds",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
        "status": "pending"
      }
    },
     {
      "id": "2",
      "type": "user",
      "attributes": {
        "username": "LGisgreat",
        "email": "LG123@gmail.com",
        "zipcode": "63637",
        "bio": "Caretaker for sister in mid thirties with learning disabilities",
        "likes": "quiet activities",
        "dislikes": "lots of people",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
        "status": "pending"
      }
    }
  ]
}

```