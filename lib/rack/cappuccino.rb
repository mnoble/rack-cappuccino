require "sinatra"

module Rack
  class Cappuccino < Sinatra::Base
    VERSION = "0.0.2"
    
    # Caller from when this file is loaded. Includes +config.ru+
    # which we need for +root+.
    #
    CALLER  = caller

    # Little big of magic to find the directory of the +config.ru+
    # file, ie: the root directory for our application.
    #
    # It looks through +CALLER+ for a call originating from +config.ru+,
    # extracts it's relative path out and join it with +Dir.getwd+.
    # This gives us the full path to +config.ru+ and subsequently
    # the root of our app.
    #
    # If +config.ru+ was not used, it raises an error.
    #
    def self.root
      config = CALLER.select { |c| c =~ /(config.ru)/ }.first
      config = config.scan(/(^.*?config\.ru)/).flatten.first
      ::File.dirname(::File.join(Dir.getwd, config))
    rescue NoMethodError => e
      raise "Rack::Cappuccino apps must be loaded from a config.ru file."
    end

    mime_type :plist, "application/octet-stream"
    mime_type :sj,    "application/octet-stream"
    mime_type :cib,   "application/octet-stream"

    set :static, true
    set :public, lambda { self.root }

    get "/" do
      send_file ::File.join(self.class.public, "index.html")
    end
  end
end