# AuthApiDemo

## Setup

1. setup database
```
$ docker-compose up -d
```

2. install dependencies

```sh
$ mix deps.get
```

3. running

```
$ mix phx.server
```

## Examples

### sign-up
```
POST http://localhost:4000/sign-up
Content-Type: application/json

{
  "user": {
    "email": "foo@example.com",
    "password": "somePassword"
  }
}
```

response:
```
{
    "jwt": <token>
}
```

### sign-in

```
POST http://localhost:4000/sign-in
Content-Type: application/json

{
    "email": "foo@example.com",
    "password": "somePassword"
}
```

response:
```
{
    "jwt": <token>
}
```

### whoami

```
GET http://localhost:4000/whoami
Content-Type: application/json
Authorization: Bearer <set jwt token>
```

response:
```
{
    "id": 1,
    "email": "foo@example.com"
}
```


