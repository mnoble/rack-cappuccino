# rack-cappuccino

Create a Rack app from your Cappuccino app.

## Usage

Add a Gemfile in the root of your app with the following:

    source :rubygems
    gem "rack-cappuccino"
  
Create a config.ru with the following:

    require "bundler/setup"
    require "rack/cappuccino"
  
    run Rack::Cappuccino.new(:appname => APPNAME)
  
Replace APPNAME with the name of your app as it appears in the Build/Release directory.

## Build before you deploy

Make sure you build your Release target before you deploy your app. Rack::Cappuccino uses it as the root directory for the Rack app.

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

