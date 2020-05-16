# AuthApiDemo

## Setup

### 1. setup database
```
$ docker-compose up -d
```

### 2. install dependencies

```sh
$ mix deps.get
```

### 3. running

```
$ mix phx.server
```

## Examples

You can try the API with [VSCode's REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) and [this file](https://github.com/koga1020/auth_api_demo/blob/master/requests/example.http).

### sign-up

request:
```http
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
```json
{
    "jwt": <token>
}
```

### sign-in

request:
```http
POST http://localhost:4000/sign-in
Content-Type: application/json

{
    "email": "foo@example.com",
    "password": "somePassword"
}
```

response:
```json
{
    "jwt": <token>
}
```

### whoami

request:
```http
GET http://localhost:4000/whoami
Content-Type: application/json
Authorization: Bearer <set jwt token>
```

response:
```json
{
    "id": 1,
    "email": "foo@example.com"
}
```


