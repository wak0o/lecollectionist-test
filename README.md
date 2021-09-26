# Le Collectionist Test

## Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.0.0](https://github.com/wak0o/lecollectionist-test/blob/main/.ruby-version)
- Rails [6.1.4](https://github.com/wak0o/lecollectionist-test/blob/main/README.md)

## Install

##### 1. Check out the repository

```bash
git clone https://github.com/wak0o/lecollectionist-test.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create db:migrate db:seed
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000