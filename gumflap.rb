require "sinatra/base"

class Gumflap < Sinatra::Base
  get "/" do
    "Hello world"
  end
end

