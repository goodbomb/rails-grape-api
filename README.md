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

The ```defaults.rb``` file is where all common configuration is done for the API (including HTTP Headers).

### Core Components / Gems

- Ruby v2.1.2
- Rails v4.1.1
- Grape
- Grape-Entities
- Seedbank


### Installation Notes
1) Be sure to uncomment the following lines in the ```.gitignore``` file:

```
# config/initializers/secret_token.rb
# config/secrets.yml
```

2) Make sure to install the Figaro gem (included in the Gemfile) by running ```rails generate figaro:install``` in terminal. (Refer to the v0.7.0 README for more info regarding this version of Figaro: https://github.com/laserlemon/figaro/tree/0-stable - if you are using a later version of Figaro, refer to the main github README: https://github.com/laserlemon/figaro)

3) After installation you can generate secret keys using the rake generator ```rake secret```. Then you will want to add environment specific secrets to your ```config/application.yml``` file like so:

```
development:
  secret_key: "1234"
test:
  secret_key: "4321"
production:
  secret_key: "abc123"
```


### API Notes

https://github.com/Apipie/apipie-rails

Apipie is included in the Gemfile but commented out. It is included for the eventual documentation of the API.

To see all API routes, run the following commend in terminal from your application directory: ```rake api:routes```
