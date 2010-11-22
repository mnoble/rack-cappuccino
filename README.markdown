# rack-cappuccino

Create a Rack app from your Cappuccino app.

## Usage

#### Pre-reqs

    gem install bundler

#### Build your Release target

    jake release

#### Create a Gemfile in your Build/Release/APPNAME directory, with the following:

    source :rubygems
    gem "sinatra"
    gem "rack-cappuccino"

#### Install them if they're not already

    bundle install

#### Create a config.ru in the same directory, with the following:

    require "rack/cappuccino"
    run Rack::Cappuccino

## Deploying to Heroku

    cd Build/Release/APPNAME
    git init
    bundler install
    git add .
    git ci -m "..."
    heroku create
    git push heroku master

### Example application on Heroku

[http://electric-stream-88.heroku.com/](http://electric-stream-88.heroku.com/)

## Contributing to rack-cappuccino
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2010 Matte Noble. See LICENSE for further details.

