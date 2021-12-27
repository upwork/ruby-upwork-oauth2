#!/usr/bin/ruby

$:.unshift '../lib'

$LOAD_PATH << File.dirname(__FILE__)

require 'upwork/api'
require 'upwork/api/routers/graphql'
require 'upwork/api/routers/auth'
require 'upwork/api/routers/messages'
require 'upwork/api/routers/reports/time'
require 'upwork/api/routers/freelancers/search'

# initiate config
config = Upwork::Api::Config.new({
  'client_id'     => 'xxxxxxxx',
  'client_secret' => 'xxxxxxxx',
  'redirect_uri'  => 'https://a.callback.url',
#  'access_token'  => 'xxxxxxxx',
#  'refresh_token' => 'xxxxxxxx',
#  'expires_in'    => '86399'
#  'expires_at'    => '1518017490',
#  'debug'         => true
})

# setup client
client = Upwork::Api::Client.new(config)

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

# WARNING: the access token will be refreshed automatically for you
# in case it's expired, i.e. expires_at < time(). Make sure you replace the
# old token accordingly in your security storage. Call client.get_actual_config
# periodically to sync-up the data
@actual_access_token_data = client.get_actual_config

# execute graphql request
#client.set_org_uid_header('1234567890') # Organization UID (optional)
#graphql = Upwork::Api::Routers::Graphql.new(client)
#params = {
#  'query' => "query {
#      user {
#        id
#        nid
#        rid
#      }
#      organization {
#        id
#      }
#    }"
#}
#data = graphql.execute params
#p data['data']['user']['id']

# get my auth data
#auth = Upwork::Api::Routers::Auth.new(client)
#info = auth.get_user_info
#p info['server_time']

# work with timereports
#report = Upwork::Api::Routers::Reports::Time.new(client)
#report_response = report.get_by_freelancer_limited('xxxxxxxx', {'tqx' => 'out:json', 'tq' => "select task where worked_on >= '2018-01-01' AND worked_on <= '2018-01-10' order by worked_on"})

# work with search
#params = {'q' => 'python AND java AND (perl OR php)'}
#freelancers = Upwork::Api::Routers::Freelancers::Search.new(client)
#p freelancers.find(params)

# work with messages
#messages = Upwork::Api::Routers::Messages.new(client)
#params = {
#  'story' => '{"message": "test message from api", "userId": "~xxxxxxxx", "orgId": "xxxxxxxx"}'
#}
#messages.send_message_to_room 'company-xxxxxxxx', 'room-xxxxxxxx', params
