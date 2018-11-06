$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/logger'
require 'upwork/api/config'
require 'upwork/api/client'
require 'test/unit'
require 'mocha/test_unit'

class ConfigTest < Test::Unit::TestCase
  include TestHelper
  
  def test_config_initialization
    config = Upwork::Api::Config.new({
      'client_id'     => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'client_secret' => 'xxxxxxxxxxxxxxxx',
      'redirect_uri'  => 'https://a.redirect.uri',
      'access_token'  => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'refresh_token' => 'xxxxxxxxxxxxxxxx',
      'debug'         => false
    })
    
    client = Upwork::Api::Client.new(config)
    client.epoint = 'gds'

    assert_equal '/api/v3/oauth2/authorize',client.url_auth
    assert_equal '/api/v3/oauth2/token',client.url_rtoken
    assert_equal '/api/v3/oauth2/token',client.url_atoken
    assert_equal 'gds',client.epoint 
  end
  
  def test_get
    assert get_client_mock.get('/some/api/url')
  end
  
  def test_post
    assert get_client_mock.post('/some/api/url', {})
  end
  
  def test_put
    assert get_client_mock.put('/some/api/url', {})
  end
  
  def test_delete
    assert get_client_mock.delete('/some/api/url', {})
  end
end
