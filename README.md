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

The Devise gem is used for user registration and authentication. The following paths are set up for JSON requests through devise:

```
API_URL + '/user/signup'
API_URL + '/user/login'
```

New accounts are sent an email with a confirmation URL that confirms the account at an API URL and then redirects back to a defined path. Overwritten Devise controllers can be found in the ```app/controllers/user/``` directory.

### Core Components / Gems

- Ruby v2.1.2
- Rails v4.1.1
- Grape
- Grape-Entities
- Seedbank


### Installation Notes
1) Make sure to install the Figaro gem (included in the Gemfile) by running ```rails generate figaro:install``` in terminal. (Refer to the v0.7.0 README for more info regarding this version of Figaro: https://github.com/laserlemon/figaro/tree/0-stable - if you are using a later version of Figaro, refer to the main github README: https://github.com/laserlemon/figaro). The newly generated ```application.yml``` will be added to your ```.gitignore``` file and environment variables should be specific to the development environment.

2) After installation you can generate secret keys using the rake generator ```rake secret```. Then you will want to add environment specific secrets to your ```config/application.yml``` file like so:

```
development:
  secret_key: "1234"
test:
  secret_key: "4321"
production:
  secret_key: "abc123"
```

NOTE: Production apps won't make use of the variables set in figaro, so there's not much point in setting them.


3) You will also want to configure the Devise mailer variables for email notifications (for registration and password reset). In your ```application.yml``` file, add the following variables:

```
EMAIL_SERVER: 	"smtp.example.com"
EMAIL_DOMAIN: 	"example.com"
EMAIL_USERNAME: "username@example.com" # Username is sometimes not an email address
EMAIL_PASSWORD: "password12345"

# The following paths should be set to your front end framework's URL (ie: AngularJS).
ACCOUNT_CONFIRMATION_PATH: "http://localhost:5000/"
RESET_PASSWORD_PATH: "http://localhost:5000/"
```

When deploying to the production environment (namely Heroku), you can add these environment variables with the following command:

```
heroku config:add EMAIL_SERVER=smtp.example.com EMAIL_DOMAIN=example.com EMAIL_USERNAME=username@example.com EMAIL_PASSWORD=password12345
```


### API Notes

https://github.com/Apipie/apipie-rails

Apipie is included in the Gemfile but commented out. It is included for the eventual documentation of the API.

To see all API routes, run the following command in terminal from your application directory: ```rake api:routes```
