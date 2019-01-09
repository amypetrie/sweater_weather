# WeatherBug

WeatherBug is a RESTful API built in Rails 5.2 that retrieves and sends collections of current and future weather data based on a city/state/landmark location, consuming APIs from Bing Maps, DarkSky, and Giphy.

Please review the below instructions to get WeatherBug up and running on your local machine for development and testing purposes.

## Table of Contents

⋅⋅* Endpoint Explanation
⋅⋅* Prerequisites
⋅⋅* Testing Dependencies
⋅⋅* APIs consumed (keys required)
⋅⋅* Additional Gems
⋅⋅* Installation
⋅⋅* Running the Test Suite

## Endpoint Explanation

## Prerequisites 

Ruby v. 2.4
Rails v. 5.2
Puma v. 3.7
PG v. 1.1.3

## Testing Dependencies

Rspec-Rails
Capybara
Factory_bot_rails
Webmock
VCR
Faraday

## APIs Consumed (keys required)

Bing Maps
DarkSky
Giphy

## Additional Gems

Bcrypt
Fast_jsonapi
Shoulda-matchers
Database_cleaner
Figaro

## Installation
Clone down this repository, change into the root directory and run:

`bundle`

To setup the database necessary for this API, run the following commands:

`bundle exec rake db:create`
`bundle exec rake db:migrate`

## Running the Test Suite

Run `bundle exec rspec` to run the full test suite.

Run `bundle exec rspec <TEST PATH>` to run a specific test
