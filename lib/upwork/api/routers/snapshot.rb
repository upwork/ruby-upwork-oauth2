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
      # Snapshot
      class Snapshot
        ENTRY_POINT = 'api'
        
        # Init
        #
        # Arguments:
        #  client: (Client)
        def initialize(client)
          @client = client
          @client.epoint = ENTRY_POINT 
        end
        
        # Get snapshot info by specific contract
        #
        # Arguments:
        #  contract: (String)
        #  ts: (String)
        def get_by_contract(contract, ts)
          $LOG.i "running " + __method__.to_s
          @client.get '/team/v3/snapshots/contracts/' + contract + '/' + ts
        end
        
        # Update snapshot by specific contract
        #
        # Arguments:
        #  contract: (String)
        #  ts: (String)
        #  params: (Hash)
        def update_by_contract(contract, ts, params)
          $LOG.i "running " + __method__.to_s
          @client.put '/team/v3/snapshots/contracts/' + contract + '/' + ts, params
        end
        
        # Delete snapshot by specific contract
        # Arguments:
        #  contract: (String)
        #  ts: (String)
        def delete_by_contract(contract, ts)
          $LOG.i "running " + __method__.to_s
          @client.delete '/team/v3/snapshots/contracts/' + contract + '/' + ts
        end
      end
    end
  end
end
