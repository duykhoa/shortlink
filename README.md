## Short link project

## Install

- Clone the code
- bundle install
- rake db:migrate
- rails s

## Usage

### Shorten a link

```
GET /shorten
```

Params:

```
- url: the url want to shorten
- user_id: id of user who want to convert
```

### Get Full url

```
GET /full_url
```

Params

```
- url: the short url
```

### List all user's full urls

```
  GET /users/:user_id/urls
```


Thanks for reading!
