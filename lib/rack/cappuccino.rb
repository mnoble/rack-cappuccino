require "pathname"
require "rack/request"

module Rack
  class Cappuccino
    VERSION = "0.0.1"
    
    attr_accessor :root

    def initialize(*args)
      appname = args.last.delete(:appname)
      @root   = "Build/Release/#{appname}"
    end

    def call(env)
      info = Request.new(env).path_info
      info = "/index.html" if info == "/"
      path = Pathname.new(::File.join(@root, info))
      mime = Mime.mime_type(path.extname)

      if path.exist? && !path.directory? && path.to_s !~ /\.\./
        [200, { "Content-Type" => mime, "Content-Length" => path.size.to_s }, [path.read]]
      else
        [404, {"Content-Type" => "text/plain"}, [""]]
      end
    end

  end
end