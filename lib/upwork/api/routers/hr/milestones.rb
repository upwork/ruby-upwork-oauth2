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
      module Hr
        # Milestones workflow
        class Milestones
          ENTRY_POINT = 'api'
          
          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT 
          end
          
          # Get active Milestone for specific Contract
          #
          # Arguments:
          #  contract_id: (String)
          def get_active_milestone(contract_id)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
          
          # Get active Milestone for specific Contract
          #
          # Arguments:
          #  milestone_id: (String)
          def get_submissions(milestone_id)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
          
          # Create a new Milestone
          #
          # Arguments:
          #  params: (Hash)
          def create(params)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
          
          # Edit an existing Milestone
          #
          # Arguments:
          #  milestone_id: (String)
          #  params: (Hash)
          def edit(milestone_id, params)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
          
          # Activate an existing Milestone
          #
          # Arguments:
          #  milestone_id: (String)
          #  params: (Hash)
          def activate(milestone_id, params)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
          
          # Approve an existing Milestone
          #
          # Arguments:
          #  milestone_id: (String)
          #  params: (Hash)
          def approve(milestone_id, params)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
          
          # Delete an existing Milestone
          #
          # Arguments:
          #  milestone_id: (String)
          def delete(milestone_id)
            $LOG.i "running " + __method__.to_s
            raise StandardError.new "The legacy API was deprecated. Please, use GraphQL call - see example in this library."
          end
        end
      end
    end
  end
end
