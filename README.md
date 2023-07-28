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


## Users
<!-- GET "/api/v1/users"
GET "/api/v1/users/:id" -->

GET "/api/v1/users/:id/events"

This endpoint will get all of one user's events.

Success Response (200 OK):
  - Status: 200 OK
  - Description: Successful response with list of events belonging to specific user id.
  - Data Format: An array of event objects, each containing "id", "type", and "attributes".

```
Status: 200 OK

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

Error Response (404 Not Found):
  - Status: 404 Not Found
  - Description: The requested user was not found.
  - Data Format: Error message for human.

```
Status: 404 Not Found

{
  "error": {
    "code": "not_found",
    "message": "The requested user was not found."
  }
}
```

## Events

GET "/api/v1/events"

This endpoint will get a list of all events.

Success Response (200 OK):
  - Status: 200 OK
  - Description: Successful response with list of events.
  - Data Format: An array of event objects, each containing "id", "type", and "attributes".

```
Status: 200 OK

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
        "host": "1"
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

```
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

```
Status: 200 OK

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
    "host": "1"
  }
}
```

Error Response (404 Not Found):
  - Status: 404 Not Found
  - Description: The requested event was not found.
  - Data Format: Error message for human.

```
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

```
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

POST "/api/v1/users/:id/events/new"

This endpoint will allow a user to create an event.

OAuth GET point.

Success Response: (201 Created):
  - Status: 201 Created
  - Description: An event is successfully created.
  - Data Format: The created event object, containing "id", "type", and "attributes".

```
Status: 201 Created

{
  "data": {
    "id": "12",
    "type": "event",
    "attributes": {
      "title": "A New Event",
      "description": "A new activity",
      "street_address": "5479 William Way, East Sonnyhaven, LA",
      "zip_code": "63637",
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

```
Status: 400 Bad Request

{
  "error": {
    "message": "Invalid parameters."
  }
}
```

PATCH "/api/v1/users/:id/events/:id"

This endpoint will allow a user to update their event.

OAuth return point.

```
Status: 200 OK

{
  "id": "1",
  "type": "event",
  "attributes": {
    "title": "Updated Gathering",
    "description": "Updated Movie",
    "street_address": "5479 William Way, East Sonnyhaven, LA",
    "zip_code": "63637",
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

```
Status: 400 Bad Request

{
  "error": {
    "message": "Invalid parameters. Request to update event is not valid."
  }
}
```

DELETE "/api/v1/users/:id/events/:id"

This endpoint will allow a user to delete their event.

OAuth return point.

response for successful deletion:

```
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

```
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