require "rspec"
require "rack/mock"
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "rack/cappuccino"

module SpecHelper
  def initialize
    @app      = Rack::Cappuccino.new(:appname => "Foobar")
    @app.root = File.join(File.dirname(__FILE__), "support")
  end
  
  def get(path)
    request = Rack::MockRequest.new(@app)
    request.get(path)
  end
end
