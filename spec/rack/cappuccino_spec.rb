require File.dirname(__FILE__) + '/../spec_helper'

describe "Rack::Cappuccino" do
  include Rack::Test::Methods
  
  NOT_FOUND = 404
  OK        = 200
  
  def app
    support_root = File.expand_path("../../support", __FILE__)
    Rack::Cappuccino.stub(:root).and_return(support_root)
    Rack::Cappuccino
  end

  it "should send a 200" do
    get "/index.html"
    last_response.status.should == OK
  end

  it "should return a 404 for non-existent resources" do
    get "/doesnt_exist.html"
    last_response.status.should == NOT_FOUND
  end

  it "should not allow .. in the path" do
    get "/../spec_helper.rb"
    last_response.status.should == NOT_FOUND
  end

  it "should have a content-length of 20" do
    get "/index.html"
    last_response.headers["Content-Length"].to_i.should == 20
  end

  it "should handle html content-type" do
    get "/index.html"
    last_response.content_type.should =~ %r{text/html}
  end

  it "should have the file contents as the last_responseonse body" do
    get "/index.html"
    last_response.body.should == "<h1>Hello World</h1>"
  end
  
  it "should return the body on index.html if an empty path is given" do
    get "/"
    last_response.status.should == OK
  end

  it "should handle css content-type" do
    get "/style.css"
    last_response.content_type.should =~ %r{text/css}
  end

  it "should handle javascript content-type" do
    get "/script.js"
    last_response.content_type.should =~ %r{application/javascript}
  end
end