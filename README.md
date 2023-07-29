<h1> Jana Social </h1>

[Render deployment for BE](https://jana-social-be.onrender.com) <br>
[Render deployment for FE](https://jana-social-fe.onrender.com/) <br>
[DB schema](https://erd.dbdesigner.net/designer/schema/1690390259-jana_social) <br>
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
 - Blaine Glasgow: [GitHub](https://github.com/GlowMunch) | LinkedIn
 - Amy Spears: [GitHub](https://github.com/Amspears007) | [LinkedIn](https://www.linkedin.com/in/amy-marie-spears-900997105/)
 - Steven Stackhouse: [GitHub](https://github.com/stackmm) | [LinkedIn](https://www.linkedin.com/in/steven-stackhouse/)

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

{"data":
  [
    {"id":"1",
    "type":"user",
    "attributes":
      {
        "username":"schroederJerde",
        "email":"schroederJerde@gmail.com",
        "zipcode":"80301",
        "street_address":"123 Main Street, New York, NY",
        "bio":"Lorem ipsum dolor sit amet",
        "likes":"consectetur adipiscing elit",
        "dislikes":"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
        "latitude":"40.712776",
        "longitude":"-74.005974"
      }
    },
    {"id":"2",
    "type":"user",
    "attributes":
      {
        "username":"bustarhymes",
        "email":"bustarhymes@gmail.com",
        "zipcode":"80303",
        "street_address":"123 Main Street, Boulder, CO",
        "bio":"Lorem ipsum dolor sit amet",
        "likes":"consectetur adipiscing elit",
        "dislikes":"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
        "latitude":"-122.3951096",
        "longitude":"37.7941013"
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

{"data":
  {
    "id":"1",
    "type":"user",
    "attributes":
    {
      "username":"schroederJerde",
      "email":"schroederJerde@gmail.com",
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
        "private": "true",
        "host": "Percival Mangst",
        "user_id": "134"
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
        "private": "false",
        "host": "Percival Mangst",
        "user_id": "134"
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
        "private": "true",
        "host": "Isabelle Stuart",
        "user_id": "186"
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
        "private": "false",
        "host": "Joey Jospeh Mariella",
        "user_id": "17"
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
        "private": "true",
        "host": "1"
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
        "private": "false",
        "host": "6"
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
    "private": "true",
    "host": "1"
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
      "status": "accepted",
    },
    {
      "event_title": "Casey's Baseball Funtime",
      "user_name": "Corey",
      "status": "accepted",
    },
    {
      "event_title": "Casey's Baseball Funtime",
      "user_name": "Staci",
      "status": "pending",
    },
    {
      "event_title": "Casey's Baseball Funtime",
      "user_name": "Anderson",
      "status": "denied",
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
      "private": "true",
      "host": "1"
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
    "private": "true",
    "host": "1"
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

<!-- Status: 400 Bad Request

{
"error":"Invalid request parameters"
} -->

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

This endpoint will allow a user to create a friendship (the first user approves another user, but the other user has not yet approved).

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

 PATCH "/api/v1/friendships/:id"
  Success Response: 200
  ```JSON

  This endpoint will allow a user to approve a friendship (second person approves the friendship originator)
  Data Format: A user object is created that contains their "user_id" and another user_id.  It also returns an enum "status" of "approved"
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
        "status": "approved"
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
        "status": "approved"
      }
    }
  ]
}

```