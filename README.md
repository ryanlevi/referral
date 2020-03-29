# README

created using Rails 6.0.2.2 and ruby 2.6.3

to run:
rake db:migrate
rails s

using postman (or any other way to make api requests), use these examples to make requests:

POST http://localhost:3000/api/appointments:

```
{
"id": "1",
"customer": "test_customer",
"client": "test_client",
"title": "test_title",
"description": "test_desc",
"start_time": "2020-02-01T09:07:21.2",
"duration_in_minutes": "2"
}
```

You should receive the following as a response:

```
{
    "id": 1
}
```

GET http://localhost:3000/api/appointments should respond with:

```
[
    {
        "id": 1,
        "title": "test_title",
        "description": "test_desc",
        "start_time": "2020-02-01T09:07:21.200Z",
        "duration_in_minutes": 2,
        "customer": {
            "id": 2,
            "username": "test_customer"
        },
        "client": {
            "id": 1,
            "username": "test_client"
        }
    }
]
```

GET http://localhost:3000/api/appointments/1/ should respond with:

```
{
    "id": 1,
    "title": "test_title",
    "description": "test_desc",
    "start_time": "2020-02-01T09:07:21.200Z",
    "duration_in_minutes": 2,
    "customer": {
        "id": 2,
        "username": "test_customer"
    },
    "client": {
        "id": 1,
        "username": "test_client"
    }
}
```

PUT http://localhost:3000/api/appointments/1/ with the following body:

```
{
"id": "1",
"customer": "test_customer",
"client": "test_client",
"title": "test_title0",
"description": "test_desc",
"start_time": "2020-02-01T09:07:21.2",
"duration_in_minutes": "2"
}
```

Should respond with:

```
{
    "id": 1,
    "title": "test_title0",
    "description": "test_desc",
    "start_time": "2020-02-01T09:07:21.200Z",
    "duration_in_minutes": 2,
    "customer": {
        "id": 2,
        "username": "test_customer"
    },
    "client": {
        "id": 1,
        "username": "test_client"
    }
}
```

DELETE http://localhost:3000/api/appointments/ should respond with:

```
Deleted all appointments.
```

DELETE http://localhost:3000/api/appointments/1/ should respond with:

```
test_title0 deleted.
```
