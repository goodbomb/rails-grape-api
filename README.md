Rails Grape API
===============

***THIS PROJECT IS NO LONGER MAINTAINED. USE AT YOUR OWN RISK.***

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

New accounts are sent an email with a confirmation URL that confirms the account and immediately redirect the user back to a defined path (specified in local environment variables - see section 3 for Installation Notes). Overwritten Devise controllers can be found in the ```app/controllers/user/``` directory.

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

NOTE: Production apps generally won't make use of the variables set in figaro (and you shouldn't commit environment variables to github for security reasons), so there's not much point in setting them.


3) You will also want to configure the Devise mailer variables for email notifications (for registration and password reset). In your ```application.yml``` file, add the following variables:

```
HTTP_SECRET_KEY:	"secret"

EMAIL_SERVER:		"smtp.example.com"
EMAIL_DOMAIN: 	"example.com"
EMAIL_USERNAME: "username@example.com" # Username is sometimes not an email address
EMAIL_PASSWORD: "password12345"

API_BASE_URL: "http://localhost:3000/"
# The following variable should be set to your front end framework's URL (ie: AngularJS).
FRONT_END_BASE_URL: "http://localhost:5000/" # Trailing slash is important!!
```

When deploying to the production environment (namely Heroku), you can add these environment variables with the following command:

```
heroku config:add HTTP_SECRET_KEY=secret EMAIL_SERVER=smtp.example.com EMAIL_DOMAIN=example.com EMAIL_USERNAME=username@example.com EMAIL_PASSWORD=password12345 FRONT_END_BASE_URL=http://localhost:5000/ API_BASE_URL=http://localhost:3000/
```


### API Notes

https://github.com/Apipie/apipie-rails

Apipie is included in the Gemfile but commented out. It is included for the eventual documentation of the API.

To see all API routes, run the following command in terminal from your application directory: ```rake api:routes```
