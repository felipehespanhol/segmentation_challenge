Segmentation Challenge
============

Hosted in Heroku
----------------

See https://segmentationchallenge.herokuapp.com/

Requirements
------------

* Ruby 2.4.0
* Rubygems
* Bundler

Installation
------------

Install required gems with
`bundle install`

Create and seed the database
`bundle exec rake db:create db:migrate db:seed`

Run locally at http://localhost:3000 with
`rails s`

Running tests
-------------

`bundle exec rspec spec`
