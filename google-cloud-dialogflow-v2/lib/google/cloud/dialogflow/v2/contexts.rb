# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "google/cloud/dialogflow/v2/version"

require "google/cloud/dialogflow/v2/contexts/credentials"
require "google/cloud/dialogflow/v2/contexts/paths"
require "google/cloud/dialogflow/v2/contexts/client"

module Google
  module Cloud
    module Dialogflow
      module V2
        ##
        # A context represents additional information included with user input or with
        # an intent returned by the Dialogflow API. Contexts are helpful for
        # differentiating user input which may be vague or have a different meaning
        # depending on additional details from your application such as user setting
        # and preferences, previous user input, where the user is in your application,
        # geographic location, and so on.
        #
        # You can include contexts as input parameters of a
        # {Google::Cloud::Dialogflow::V2::Sessions::Client#detect_intent DetectIntent} (or
        # {Google::Cloud::Dialogflow::V2::Sessions::Client#streaming_detect_intent StreamingDetectIntent}) request,
        # or as output contexts included in the returned intent.
        # Contexts expire when an intent is matched, after the number of `DetectIntent`
        # requests specified by the `lifespan_count` parameter, or after 20 minutes
        # if no intents are matched for a `DetectIntent` request.
        #
        # For more information about contexts, see the
        # [Dialogflow
        # documentation](https://cloud.google.com/dialogflow/docs/contexts-overview).
        #
        # To load this service and instantiate a client:
        #
        #     require "google/cloud/dialogflow/v2/contexts"
        #     client = Google::Cloud::Dialogflow::V2::Contexts::Client.new
        #
        module Contexts
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "contexts", "helpers.rb"
require "google/cloud/dialogflow/v2/contexts/helpers" if ::File.file? helper_path
