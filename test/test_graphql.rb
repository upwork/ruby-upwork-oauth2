$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/graphql'
require 'test/unit'
require 'mocha/test_unit'

class GraphqlTest < Test::Unit::TestCase
  include TestHelper
  
  def test_execute
    api = Upwork::Api::Routers::Graphql.new(get_client_mock)
    assert api.execute({'query': 'query{}'})
  end
end
