# Locals API

It's a simple rails api. Provides create groups based on location.

**Key Features**:

* User authentication by Facebook;
* Groups creation;
* User can sign in group;
* List of all created groups;
* List of all near groups.

## Prerequisites

You will need the following things properly installed on your computer:

* [Postgresql](http://www.postgresql.org/)
* [Ruby](https://github.com/ruby/ruby)
* [Bundler](https://github.com/bundler/bundler)

## Installation

Before installation change the ```config/database.yml``` for your configurations.

Then execute the following commands to install dependencies and perform the migrations in the database:

```console
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

Run the tests:

```console
$ bundle exec rspec
```

Set your Facebook API KEYS as environment variables:

```console
$ export FACEBOOK_KEY=YOUR_FACEBOOK_API_KEY
$ export FACEBOOK_SECRET=YOUR_FACEBOOK_API_SCRET
```

## Usage

```console
$ rails s
```

## API Resources

### Authentication

### ```GET /auth/facebook```

Authenticates with facebook.

Response:

```json
{
  "id": 1,
  "name": "Username",
  "provider": "facebook"
}
```

Returns **200** if authentication succeds.

### ```GET /auth/signout```

Signout with facebook.

Response:

```json
{
  "message": "Good Bye!"
}
```

Returns **200** if logout succeeds.

### ```GET /sessions```

Returns the information of the authenticated user.

Response:

```json
{
  "id": 1,
  "name": "User",
  "provider": "Facebook"
}
```

Returns **200** if you're logged in or **401** if not.

### Groups

### ```POST /api/groups```

Create a group.

The form must be submitted in the format ```multipart / form-data```.

Request:

```json
{
	"name": "Describe a group",
	"latitude": -50.00,
	"longitude": -21.00,
	"active": true,
	"private": false,
	"password": "private",
	"logo": image
}
```

Response:

```json
{
	"name": "Describe a group",
	"latitude": -50.00,
	"longitude": -21.00,
	"active": true,
	"private": false,
	"password": "private"
}
```

Returns **201** if the group was registered.

### ```GET /api/groups```

Returns all registered groups.

Response:

```json
[
  {
    "name": "Group X",
    "latitude": -50.00,
    "longitude": -21.00,
    "active": true,
    "created_at": "2015-11-05T22:38:27.476-02:00",
    "logo_file_name": "LogoX.jpg"
  },
  {
    "name": "Group Y",
    "latitude": -51.00,
    "longitude": -21.00,
    "active": true,
    "created_at": "2015-11-06T22:38:27.476-02:00",
    "logo_file_name": "LogoY.jpg"
  }
]
```

Returns **200** if you're logged in or **401** if not.

### ```GET /api/groups/near?group[latitude]=-25.00&group[longitude]=-50.00```

Returns all near groups.

Response:

```json
[
  {
    "name": "Near Group X",
    "latitude": -25.00,
    "longitude": -50.00,
    "active": true,
    "created_at": "2015-11-05T22:38:27.476-02:00",
    "logo_file_name": "LogoX.jpg"
  },
  {
    "name": "Near Group Y",
    "latitude": -25.00,
    "longitude": -50.00,
    "active": true,
    "created_at": "2015-11-06T22:38:27.476-02:00",
    "logo_file_name": "LogoY.jpg"
  }
]
```

Returns **200** if you're logged in or **401** if not.

## Versions

* Ruby 2.2.3
* Rails 4.2.4
* Postgresql 9.4

## Contributing

1. Clone it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Maintainers

* [sergioaugrod](https://github.com/sergioaugrod/)
