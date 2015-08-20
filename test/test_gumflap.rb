require "minitest/autorun"
require "mocha/mini_test"
require "rack/test"

require_relative "../gumflap.rb"

class TestGumflap < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Gumflap
  end
  
  def test_post_message
    Gumflap.expects(:push).with("Hello!")

    post "/messages", message: "Hello!"
    assert_equal 204, last_response.status
  end

  def test_post_message_empty
    Gumflap.expects(:push).never
    
    post "/messages", message: "   "
    assert_equal 400, last_response.status
  end
  
end
