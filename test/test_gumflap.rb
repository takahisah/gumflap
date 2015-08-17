require "minitest/autorun"
require "rack/test"

require_relative "../gumflap.rb"

class TestGumflap < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Gumflap
  end
  
  def test_hello
    get "/"
    assert last_response.ok?
    assert_equal 'Hello world', last_response.body
  end
end
