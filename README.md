# Business Card Saver

Here is the diagram of how the database will look:

![database model](./assets/database_model.jpg)



I have two tables: `users`, and `contacts`.

- **User**
  - username (string)
  - email (string)
  - password (string)
  - This table will have a `has_many` relationship to `contacts`.
- **Contact**
  - name (string)
  - company (string)
  - department (string)
  - title (string)
  - email (string)
  - phone (string)
  - description (text)
  - This table will have a `belongs_to` relationship to a `user`.

**App Details:**

* Ruby version
  - ruby 2.4.1p111
  - coding in Ruby 5

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

