# Makers Academy Week 4 Challenge: Bookmark Manager
-----

A project to create a bookmark manager web app.

[See demo on Heroku!](https://bookmark-manager-rt.herokuapp.com/)

### Installation and Usage

To install the app locally:

- Clone the repo, go to project root folder
- Run `bundle install`
- Create local postgresql databases named `bookmark_manager_dev` and `bookmark_manager_test` so they are accessible on the localhost, i.e. `postgres://localhost/chitter_app_test`
- Run `rake db:auto_migrate_test` to build test database
- Run `rake db:auto_migrate_dev` to build dev database

To run the test suite:
- Run `rspec`

To run the app on a local webserver:
- Run `ruby app/app.rb`, by default it will be accessible on port 4567

### User Stories

```
As a user
I want to see my list of links
So that I can choose one
```

```
As a user
I want to add new links
So that I refer back to them
```

```
As a user
I want to tag links
So they are categorised according to my preferences
```

```
As a user
I want to filter links by tag
So I can browse related links
```

### Domain Model

[Click here to see Domain Model](https://app.ardoq.com/presentation/makersacademyjan2017/587e161472fa6d218cea11a4)

### Technologies Used

**Framework**
- Sinatra (modular)

**Testing**
- RSpec
- Capybara

**Database**
- Postgresql
- DataMapper (ORM)
- BCrypt (Encryption)
