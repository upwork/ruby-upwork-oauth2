# Licensed under the Upwork's API Terms of Use;
# you may not use this file except in compliance with the Terms.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author::    Maksym Novozhylov (mnovozhilov@upwork.com)
# Copyright:: Copyright 2018(c) Upwork.com
# License::   See LICENSE.txt and TOS - https://developers.upwork.com/api-tos.html

require 'json'
require 'uri'

module Upwork
  module Api
    # Client for accessing API
    class Client
      DATA_FORMAT   = 'json'
      OVERLOAD_VAR  = "http_method"
      
      URI_AUTH    = "/ab/account-security/oauth2/authorize"
      URI_RTOKEN  = "/api/v3/oauth2/token" # refresh
      URI_ATOKEN  = "/api/v3/oauth2/token" # access
      
      attr_accessor :epoint
      attr_reader :url_auth, :url_rtoken, :url_atoken
      
      # Init client
      #
      # Arguments:
      #  config: (Config)
      def initialize(config)
        $LOG.i('initializing client')
        @config = config
        @epoint = Upwork::Api::DEFAULT_EPOINT
	@url_auth, @url_rtoken, @url_atoken = URI_AUTH, URI_RTOKEN, URI_ATOKEN

	@oauth2_client = OAuth2::Client.new(
          @config.client_id,
          @config.client_secret,
	  :site => Upwork::Api::BASE_HOST,
	  :authorize_url => @url_auth,
	  :token_url => @url_atoken,
	  :connection_opts => { :headers => {'User-Agent:' => 'Github Upwork API Ruby Client' }}
	)
      end
      
      # Start auth process and get authorization URL
      def get_authorization_url
        $LOG.i "requesting authorization URL"
 
        @oauth2_client.auth_code.authorize_url(:redirect_uri => @config.redirect_uri)
      end
      
      # Finish auth process and get access token
      #
      # Arguments:
      #  authz_code: (String)
      def get_access_token(authz_code)
        $LOG.i "getting access and refresh token pair"
	@access_token = @oauth2_client.auth_code.get_token(authz_code, :redirect_uri => @config.redirect_uri)
        $LOG.i "got access and refresh token pair", @access_token

	refresh_config_from_access_token

	@access_token
      end

      # Get actual client config
      def get_actual_config
        @config
      end
      
      # Run GET request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def get(uri, params = {})
        send_request(uri, :get, params)
      end
      
      # Run POST request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def post(uri, params = {})
        send_request(uri, :post, params)
      end
      
      # Run PUT request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def put(uri, params = {})
        send_request(uri, :put, params)
      end
      
      # Run DELETE request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def delete(uri, params = {})
        send_request(uri, :delete, params)
      end
      
      # Get full URL
      def full_url(uri) # :nodoc:
        Upwork::Api::BASE_HOST + '/' + get_uri_with_format(uri);
      end
      
      # Get URI with :format
      def get_uri_with_format(uri) # :nodoc:
        (@epoint) + uri + ((@epoint == 'api') ? '.' + DATA_FORMAT : '')
      end
      
      private

      # Refresh config from the actual access token
      def refresh_config_from_access_token
        $LOG.i "saving access token data in config object"
        
        @config.access_token  = @access_token.token
        @config.refresh_token = @access_token.refresh_token
        @config.expires_in = @access_token.expires_in
        @config.expires_at = @access_token.expires_at

	$LOG.i "new config is", @config
        
        @config
      end
      
      # get url with parameters for get requests
      def get_url_with_params(path, params)
        "#{path}?".concat(params.collect{|k,v| "#{k}=#{OAuth::Helper::escape(v.to_s)}"}.join("&"))
      end
      
      # Send request
      def send_request(uri, method = :get, params = {}) # :nodoc:
        $LOG.i "send request for url", uri
        $LOG.i "and method", method
        
        if method == :put or method == :delete
          $LOG.i "add overload parameter"
          params[OVERLOAD_VAR] = method.to_s
        end
        
        $LOG.i "and parameters", params
        
        @access_token = OAuth2::AccessToken.new(
	  @oauth2_client,
	  @config.access_token,
	  :refresh_token => @config.refresh_token,
	  :expires_at => @config.expires_at
	)

	# expired? then refresh it
	if @access_token.expired?
	  $LOG.i "access token has expired, refreshing..."
	  @access_token = @access_token.refresh!
	  refresh_config_from_access_token
	end

        case method
        when :get
          url = get_url_with_params get_uri_with_format(uri), params
          response = @access_token.get(url).body
        when :post, :put, :delete
          response = @access_token.post(get_uri_with_format(uri), {body: params}).body
        else
          raise ArgumentError, "Don't know how to handle http method: :#{method.to_s}"
        end
        $LOG.i "got response from server", response
        JSON.parse(response)
      end
      
    end
  end
end
