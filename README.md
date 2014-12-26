== README

Rails app is built on:

- Ruby version 2.1.3
- Rails version 4.1.6
- Postgres
- Unicorn web server


General notes on architecture:

- Devise + CanCanCan + Rolify for authentication, authorization, and roles management

- ActiveAdmin for back-of-house administration by personnel

- JSON API for mobile app(s) available under /api/v1/ route, using simple token authorization. (API documentation via ApiPie)

- sections_rails plugin for easily grouping frontend assets with views


General notes on development:

git-town is used to automate high-level git processes and ensure a linear git history


Getting started:

-git clone 
  the repo

install PhantomJS for headless browser integration testing: 
- brew install phantomjs

do the usual:
-bundle install
-bundle exec rake db:create
-bundle exec rake db:migrate
-bundle exec rake db:seed
  
  to run the server locally: 
  -foreman start 
  visit at localhost:5000
