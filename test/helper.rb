$:.unshift 'lib'

require 'upwork/api'

$LOG = Upwork::Api::Logger.new

module TestHelper
  def get_client_mock    
    config = Upwork::Api::Config.new({
      'client_id'     => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'client_secret' => 'xxxxxxxxxxxxxxxx',
      'redirect_uri'  => 'https://a.redirect.uri',
      'access_token'  => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'refresh_token' => 'xxxxxxxxxxxxxxxx',
      'debug'         => false
    })
    
    client = Upwork::Api::Client.new(config)
    client.expects(:send_request).returns(true)
    client
  end
end
