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
# Copyright:: Copyright 2014(c) Upwork.com
# License::   See LICENSE.txt and TOS - https://developers.upwork.com/api-tos.html

module Upwork
  module Api
    module Routers
      module Freelancers
        # Freelancer's profile info
        class Profile
          ENTRY_POINT = 'api'
          
          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT 
          end
          
          # Get specific profile
          #
          # Arguments:
          #  key: (String)
          def get_specific(key)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end

          # Get brief info on specific profile
          #
          # Arguments:
          #  key: (String)
          def get_specific_brief(key)
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
            @client.get '/profiles/v1/providers/' + key + '/brief'
          end
        end
      end
    end
  end
end
