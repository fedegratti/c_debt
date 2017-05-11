[![Build Status](https://travis-ci.org/fedegratti/c_debt.svg?branch=master)](https://travis-ci.org/fedegratti/c_debt)
[![coverage](https://codecov.io/gh/fedegratti/c_debt/branch/master/graph/badge.svg)](https://codecov.io/gh/fedegratti/c_debt)

# dues
The cloudtag's due system.

## Instalation

### Requirements
######Ruby >= 2.2.2
######postgresql >= 9.5

Clone this repo, open a terminal, go to the repo's folder and run the following commands:

1: Edit `config/database.yml` with your credentials.

2: Install all the gems we need.
 `bin/bundle install`

3: Create the db.
`bin/rake db:create`

4: Migrate the db.
`bin/rake db:migrate`

5: Set the cron jobs.
`bin/whenever --update-crontab`

5: (optional) Insert some seeds.
`bin/rake db:seed`

6: (optional) Run the tests.
`bin/rake test`

And that's it!

Just run rails using  `rails s`

Enjoy!

**note:** You need to start sidekiq (redis required) in order to use instant emails

## Entity–relationship model:

![alt tag](https://github.com/fedegratti/c_debt/blob/master/Entity_relationship_diagram.png)
