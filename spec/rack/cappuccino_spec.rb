require File.dirname(__FILE__) + '/../spec_helper'

describe Rack::Cappuccino do
  include SpecHelper
  NOT_FOUND = 404
  OK        = 200

  let(:resp) { get("/index.html") }

  it "should construct the root path based on 'appname'" do
    app = Rack::Cappuccino.new(:appname => "Hasslehoff")
    app.root.should == "Build/Release/Hasslehoff"
  end

  it "should send a 200" do
    resp.status.should == OK
  end

  it "should return a 404 for non-existent resources" do
    resp = get("/doesnt_exist.html")
    resp.status.should == NOT_FOUND
  end

  it "should not allow .. in the path" do
    resp = get("/../spec_helper.rb")
    resp.status.should == NOT_FOUND
  end

  it "should have a content-length of 20" do
    resp.headers["Content-Length"].to_i.should == 20
  end

  it "should handle html content-type" do
    resp.content_type.should == "text/html"
  end

  it "should have the file contents as the response body" do
    resp.body.should == "<h1>Hello World</h1>"
  end
  
  it "should return the body on index.html if an empty path is given" do
    resp = get("/")
    resp.body.should == "<h1>Hello World</h1>"
  end

  it "should handle css content-type" do
    resp = get("/style.css")
    resp.content_type.should == "text/css"
  end

  it "should handle javascript content-type" do
    resp = get("/script.js")
    resp.content_type.should == "application/javascript"
  end
end