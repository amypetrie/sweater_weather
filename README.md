# WeatherBug

WeatherBug is a RESTful API built in Rails 5.2 that retrieves and sends collections of current and future weather data based on a city/state/landmark location, consuming APIs from Bing Maps, DarkSky, and Giphy.

Please review the below instructions to get WeatherBug up and running on your local machine for development and testing purposes.

## Table of Contents

* Endpoint Explanation
* Prerequisites
* Testing Dependencies
* APIs consumed (keys required)
* Additional Gems
* Installation
* Running the Test Suite

## Endpoint Explanation

### Public
* `GET /api/v1/forecast?location=denver,co` returns three collections of weather forecast objects with data representing the location's daily, hourly, and upcoming daily weather.

* `GET /api/v1/gifs?location=denver,co"` returns a collection of upcoming daily weather forecast objects with a gif URL that corresponds to each day's weather description.

* `POST /api/v1/users` with a JSON body of a valid email, password, and password confirmation creates a user in the database and returns a unique API key for WeatherBug if authentification requirements are met.
**Request body example:** `{"email": "example@example.com", "password": "password", "password_confirmation": "password"}`

### User Authorization Required
* `POST /api/v1/sessions` with a JSON body of a valid email and password creates a user session and returns a unique API key for WeatherBug.
**Request body example:** `{"email": "example@example.com", "password": "password"}`

* `POST /api/v1/favorites` with a JSON body of a valid WeatherBug API key and location creates a favorite location in the database for the user.
**Request body example:** `{"api_key": "64eaf33ff5efbada21351a62517f", "location": "Chicago, IL"}`

* `GET /api/v1/favorites` with a JSON body of a valid WeatherBug API key returns a collection of a user's favorite locations, each with corresponding collections of weather forecast objects with data representing the location's daily, hourly, and upcoming daily weather.
**Request body example:** `{"api_key": "64eaf33ff5efbada21351a62517f"}`

## Prerequisites 

* Ruby v. 2.4
* Rails v. 5.2
* Puma v. 3.7
* PG v. 1.1.3

## Testing Dependencies

* Rspec-Rails
* Capybara
* Factory_bot_rails
* Webmock
* VCR
* Faraday

## APIs Consumed (keys required)

* Bing Maps
* DarkSky
* Giphy

## Additional Gems

* Bcrypt
* Fast_jsonapi
* Shoulda-matchers
* Database_cleaner
* Figaro

## Installation
Clone down this repository, change into the root directory and run:

`bundle`

To setup the database necessary for this API, run the following commands:

`bundle exec rake db:create`

`bundle exec rake db:migrate`

## Running the Test Suite

Run `bundle exec rspec` to run the full test suite.

Run `bundle exec rspec <TEST FILE PATH>` to run a specific test
