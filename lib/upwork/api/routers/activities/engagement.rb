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
      module Activities
        # Engagement Activities
        class Engagement
          ENTRY_POINT = 'api'
          
          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT 
          end
          
          # List activities for specific engagement
          #
          # Arguments:
          #  engagement_ref: (String)
          def get_specific(engagement_ref)
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
          
          # Assign engagements to the list of activities
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  engagement: (String)
          #  params: (Hash)
          def assign(company, team, engagement, params)
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end

          # Assign to specific engagement the list of activities
          #
          # Arguments:
          #  engagement_ref: (String)
          #  params: (Hash)
          def assign_to_engagement(engagement_ref, params)
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
        
        end
      end
    end
  end
end
