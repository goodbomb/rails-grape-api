Rails Grape API
===============

Base setup for a Ruby on Rails API using Grape.

All API controller files are located in the ```app/api``` directory. The application structure is meant to be modular and version controlled. The base application API structure looks like this:

```
/app
--- /api
------ /v1
--------- base.rb
--------- defaults.rb
--------- /users
------------ entities.rb
------------ users.rb
------ api.rb
```

### Core Components / Gems

Ruby v2.1.2
Rails v4.1.1
Grape
Grape-Entities
Seedbank

### API Notes

https://github.com/Apipie/apipie-rails
Apipie is included in the Gemfile but commented out. It is included for the eventual documentation of the API.