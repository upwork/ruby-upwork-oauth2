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

module Upwork
  module Api
    # Config storage
    class Config
      @@debug = false;
      
      attr_accessor :access_token, :refresh_token, :expires_in, :expires_at
      attr_reader :client_id, :client_secret, :redirect_uri, :grant_type
      
      # Init config object
      #
      # Arguments:
      #  config: (Hash)
      def initialize(config = {})
        @client_id, @client_secret, @redirect_uri, @grant_type = config['client_id'], config['client_secret'], config['redirect_uri'], config['grant_type']
        @access_token, @refresh_token, @expires_in, @expires_at = config['access_token'], config['refresh_token'], config['expires_in'], config['expires_at']
        @@debug = config['debug']

        $DEBUG = self.debug
      end

      # Get debug status
      def debug # :nodoc:
        @@debug
      end
    end
  end
end
