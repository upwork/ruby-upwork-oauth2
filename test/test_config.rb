$:.unshift 'lib'

require 'upwork/api/config'
require 'test/unit'
require 'mocha/test_unit'

class ConfigTest < Test::Unit::TestCase
  def test_my_config_initialization
    config = Upwork::Api::Config.new({
      'client_id'     => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'client_secret' => 'xxxxxxxxxxxxxxxx',
      'redirect_uri'  => 'https://a.redirect.uri',
      'access_token'  => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'refresh_token' => 'xxxxxxxxxxxxxxxx',
      'expires_at'    => '0123456789',
      'debug'         => false
    })
    
    assert_equal 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',config.client_id
    assert_equal 'xxxxxxxxxxxxxxxx',config.client_secret
    assert_equal 'https://a.redirect.uri',config.redirect_uri
    assert_equal 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',config.access_token
    assert_equal 'xxxxxxxxxxxxxxxx',config.refresh_token
    assert_equal '0123456789',config.expires_at
    assert_equal false,config.debug
  end
end
