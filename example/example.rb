#!/usr/bin/ruby

$:.unshift '../lib'

$LOAD_PATH << File.dirname(__FILE__)

require 'upwork/api'
require 'upwork/api/routers/graphql'

# initiate config
config = Upwork::Api::Config.new({
  'client_id'     => 'xxxxxxxx',
  'client_secret' => 'xxxxxxxx',
  'redirect_uri'  => 'https://a.callback.url',
#  'grant_type'    => 'client_credentials' # Client Credentials Grant
#  'access_token'  => 'xxxxxxxx',
#  'refresh_token' => 'xxxxxxxx',
#  'expires_in'    => '86399'
#  'expires_at'    => '1518017490',
#  'debug'         => true
})

# setup client
client = Upwork::Api::Client.new(config)

# Code Authorization Grant
# run authorization in case we haven't done it yet
# and do not have an access and refresh token pair
if !config.access_token and !config.refresh_token
  authz_url = client.get_authorization_url

  puts "Visit the authorization url and provide [authorization code] for further authorization"
  puts authz_url
  authz_code = gets.strip
  @token = client.get_access_token(authz_code)
  # store access token data in safe place!
end

# Client Credentials Grant
if !config.access_token
  @token = client.get_access_token
end

# WARNING: the access token will be refreshed automatically for you
# in case it's expired, i.e. expires_at < time(). Make sure you replace the
# old token accordingly in your security storage. Call client.get_actual_config
# periodically to sync-up the data
@actual_access_token_data = client.get_actual_config

# execute graphql request
client.set_org_uid_header('1234567890') # Organization UID (optional)
graphql = Upwork::Api::Routers::Graphql.new(client)
params = {
  'query' => "query {
      user {
        id
        nid
        rid
      }
      organization {
        id
      }
    }"
}
data = graphql.execute params
p data['data']['user']['id']
