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

<!-- GET "/api/v1/users/:id/event/:id/event_users" -->
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
      "user_id": "user_1.id",
      "event_id": "event_5.id",
      "status": "accepted",
    },
    {
      "user_id": "user_17.id",
      "event_id": "event_5.id",
      "status": "accepted",
    },
    {
      "user_id": "user_8.id",
      "event_id": "event_5.id",
      "status": "declined",
    },
    {
      "user_id": "user_37.id",
      "event_id": "event_5.id",
      "status": "pending",
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
