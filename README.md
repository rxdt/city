Vivify - Rails Server
=====================

Web app + API backend for the Vivify platform.

Architecture
------------

App is built on

* Rails 4
* Postgres
* Unicorn web server

General notes on architecture:

* Devise + CanCanCan + Rolify for authentication, authorization, and roles management
* ActiveAdmin for back-of-house administration by Vivify personnel
* JSON API for mobile app(s) available under /api/v1/ route, using simple token authorization.
  * API documentation via [ApiPie](https://github.com/Apipie/apipie-rails)(? TBD...)
* sections_rails plugin for easily grouping frontend assets with views


Getting Started
---------------

1. `git clone` the repo.
2. Install GitTown for some handy workflow tooling. (`brew tap Originate/gittown; brew install git-town`)
3. Copy `config/database.yml.example` to `config/database.yml` and tweak to match your local config

Then do the usual
```
bundle install
bundle exec rake db:create
bundle exec rake db:schema:load
bundle exec rake db:seed
```
and
```
foreman start
```
to run the server locally.  Visit at [localhost:5000](http://localhost:5000).

The seeds create two users, an investor ('investor@test.org'), and an admin ('admin@test.org'), both with the password 'password'.


Development Process
-------------------

Our development process follows the best-practices outlined in the [Originate engineering guide](https://github.com/Originate/guide).  Additionally, we are using [Git Town](https://github.com/Originate/git-town) for some handy scripts to support our engineering process.
  
Specifically:

* Use feature branches for all development, prefixed by developer's initials to identify it's owner (`git hack jd-some-feature-name`) 
* Regularly sync your feature branch (`git sync`) to stay up-to-date with master
* When code is ready for a review, push to origin and create a new PR (`git push origin jd-some-feature-name`, new PR in GitHub UI) 
* Once PR is given the thumbs-up, merge to master (`git ship`).
* **Important:** Don't click the GitHub 'merge' button - we utilize squash merges to keep a linear commit history in master.

Coding Standards
----------------

Frontend - CSS
--------------

CSS classes should use camelCase for nouns, and dashes to add modifiers.  
Example: 

```
<div class="cardsList">
  <div class="cardsList-stuff">
    ...
  </div>
</div>
```

All colors should reference named SCSS color value variables set in colors.scss.  (With the exception of greys, which should use 12-bit values a la 
'#123' etc.)

Common styling should be factored into it's own stylesheet and utilized as a mixin per best practice.

Frontend - Coffeescript
-----------------------

Todo

Backend - Ruby
--------------

Todo
